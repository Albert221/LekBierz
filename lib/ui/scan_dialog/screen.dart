import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:lek_bierz/api/medicinal_products_repository.dart';
import 'package:lek_bierz/api/models/medicinal_product.dart';

class ScanScreen extends StatefulWidget {
  @override
  State createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  CameraController controller;
  CameraDescription backCamera;
  Directory directory;

  bool waiting = false;

  @override
  void initState() {
    super.initState();
    _initCameraController();
  }

  void _initCameraController() async {
    directory = await Directory.systemTemp.createTemp();

    backCamera = (await availableCameras()).firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    controller = CameraController(this.backCamera, ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!this.mounted) {
        return;
      }
      setState(() {});
    });
  }

  void _showWaitSpinner() => setState(() => waiting = true);

  void _hideWaitSpinner() => setState(() => waiting = false);

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Skanowanie kodu kreskowego'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              _buildCamera(context),
              Container(
                  padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 48.0),
                  alignment: Alignment.bottomCenter,
                  child: _buildTakePhotoButton(context))
            ],
          );
        }));
  }

  Widget _buildTakePhotoButton(BuildContext context) {
    final contents = Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: waiting ? 0.0 : 1.0,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(
              Icons.camera,
              color: Colors.white,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text('Skanuj',
                style: TextStyle(color: Colors.white, fontSize: 20.0))
          ]),
        ),
        Opacity(
          opacity: waiting ? 1.0 : 0.0,
          child: Container(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white)),
              width: 24.0,
              height: 24.0),
        )
      ],
    );

    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: contents,
      onPressed: () => this._scan(context),
      color: Theme.of(context).accentColor,
    );
  }

  Widget _buildCamera(BuildContext context) {
    if (controller?.value?.isInitialized != true) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  Future<void> _scan(BuildContext context) async {
    if (waiting ||
        controller?.value?.isInitialized != true ||
        controller?.value?.isTakingPicture != false) {
      return;
    }

    _showWaitSpinner();

    final String photoPath = '${directory.path}/barcode-${_timestamp()}.jpg';

    try {
      await controller.takePicture(photoPath);
    } on CameraException catch (e) {
      debugPrint(e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Wystąpił błąd.'),
        duration: Duration(seconds: 2),
      ));

      _hideWaitSpinner();
      return;
    }

    final String barcode = await _proccessPhoto(photoPath);

    if (barcode == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Nie znaleziono kodu kreskowego.'),
        duration: Duration(seconds: 2),
      ));
      _hideWaitSpinner();
      return;
    }

    final MedicinalProductResponse response = await _fetchMedicinalProduct(barcode);

    _hideWaitSpinner();

    if (response == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Zeskanowany produkt nie jest produktem leczniczym.'),
        duration: Duration(seconds: 2),
      ));
    } else {
      Navigator.of(context).pop(response);
    }
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<String> _proccessPhoto(String photoPath) async {
    final FirebaseVisionImage photo =
        FirebaseVisionImage.fromFilePath(photoPath);
    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector();

    List<Barcode> barcodes;
    try {
      barcodes = await barcodeDetector.detectInImage(photo);
    } on PlatformException {
      return null;
    }

    for (Barcode barcode in barcodes) {
      if (barcode.format.value != BarcodeFormat.ean8.value &&
          barcode.format.value != BarcodeFormat.ean13.value) {
        continue;
      }

      return barcode.rawValue;
    }

    return null;
  }

  Future<MedicinalProductResponse> _fetchMedicinalProduct(String ean) async {
    final repository = MedicinalProductsRepository();

    return repository.getProductByEan(ean);
  }
}
