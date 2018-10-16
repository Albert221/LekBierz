import 'dart:convert';

import 'package:redux_persist_encoder/redux_persist_encoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePersistor extends StorageEngine {
  static const temporaryUserKey = "56dbd023-0088-4019-abff-70d78a8d9387";

  @override
  Future<void> save(String data) {
    return Firestore.instance
        .collection('users')
        .document(temporaryUserKey)
        .setData(json.decode(data));
  }

  @override
  Future<String> load() {
    return Firestore.instance
        .collection('users')
        .document(temporaryUserKey)
        .get()
        .then((doc) {
      final encoded = json.encode(doc.data);

      return encoded == 'null' ? null : encoded;
    });
  }
}
