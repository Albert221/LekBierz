import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class ScanScreen extends StatefulWidget {
  final Function(String) onBarcodeScanned;

  const ScanScreen({Key key, this.onBarcodeScanned}) : super(key: key);

  @override
  State createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  CameraController controller;
  CameraDescription backCamera;
  Directory directory;

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
        body: Stack(
          children: <Widget>[
            _buildCamera(context),
            Container(
                padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 48.0),
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text('Skanuj',
                          style: TextStyle(color: Colors.white, fontSize: 20.0))
                    ],
                  ),
                  onPressed: () => this._takePhoto(),
                  color: Theme.of(context).accentColor,
                ))
          ],
        ));
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

  Future<void> _takePhoto() async {
    if (controller?.value?.isInitialized != true ||
        controller?.value?.isTakingPicture != false) {
      return;
    }

    final String photoPath = '${directory.path}/barcode-${_timestamp()}.jpg';

    try {
      await controller.takePicture(photoPath);
    } on CameraException catch (e) {
      debugPrint(e.toString());
      return;
    }

    await _scanBarcode(photoPath);
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _scanBarcode(String photoPath) async {
    final FirebaseVisionImage photo =
        FirebaseVisionImage.fromFilePath(photoPath);
    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector();

    final List<Barcode> barcodes = await barcodeDetector.detectInImage(photo);

    for (Barcode barcode in barcodes) {
      if (barcode.format.value != BarcodeFormat.ean8.value &&
          barcode.format.value != BarcodeFormat.ean13.value) {
        continue;
      }

      if (this.widget.onBarcodeScanned != null) {
        this.widget.onBarcodeScanned(barcode.rawValue);
      }
    }
  }
}
