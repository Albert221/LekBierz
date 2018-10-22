import 'package:redux_persist_encoder/redux_persist_encoder.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart' as parent;

class FlutterStorage extends StorageEngine {
  final parent.FlutterStorage parentStorage;

  FlutterStorage(String path)
      : parentStorage = parent.FlutterStorage(path,
            location: parent.FlutterSaveLocation.sharedPreferences);

  @override
  Future<void> save(String json) {
    return parentStorage.save(json);
  }

  @override
  Future<String> load() {
    return parentStorage.load();
  }
}
