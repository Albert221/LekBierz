import 'dart:convert';
import 'dart:io';

import 'package:redux_persist_encoder/redux_persist_encoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class FirebasePersistor extends StorageEngine {
  static String _userKey;

  static Future<String> getUserKey() async {
    if (_userKey != null) return _userKey;

    final path = await getApplicationDocumentsDirectory();
    final keyPath = '$path/user.key';
    final file = File(keyPath);

    try {
      _userKey = file.readAsStringSync();
    } catch (e) {
      final key = Uuid().v4();
      file.writeAsStringSync(key);
      _userKey = key;
    }

    return _userKey;
  }

  @override
  Future<void> save(String data) {
    return getUserKey().then((key) => Firestore.instance
        .collection('users')
        .document(key)
        .setData(json.decode(data)));
  }

  @override
  Future<String> load() {
    return getUserKey()
        .then(
            (key) => Firestore.instance.collection('users').document(key).get())
        .then((doc) {
      final encoded = json.encode(doc.data);

      return encoded == 'null' ? null : encoded;
    });
  }
}
