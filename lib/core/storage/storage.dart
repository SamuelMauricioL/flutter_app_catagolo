import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage getStorage = GetStorage();

  Future<void> init() async {
    await GetStorage.init('Storage');
  }

  Future<void> write(String key, String value) async {
    await getStorage.write(key, value);
  }

  Future<String?> read(String key) {
    return Future.value(getStorage.read(key));
  }

  Future<bool> hasKey(String key) {
    return Future.value(getStorage.hasData(key));
  }

  Future clear() async {
    await getStorage.erase();
  }

  Future removeKey(String key) async {
    await getStorage.remove(key);
  }
}
