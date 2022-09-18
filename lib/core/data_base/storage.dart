import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage get _secureStorage =>
      const FlutterSecureStorage();

  static Future<void> writeFirstEnterCheck(String deepLinkCheck) async {
    _secureStorage.write(key: 'firstEnterCheck', value: deepLinkCheck);
  }

  static Future<String?> readFirstEnterCheck() async {
    return await _secureStorage.read(key: 'firstEnterCheck');
  }
}
