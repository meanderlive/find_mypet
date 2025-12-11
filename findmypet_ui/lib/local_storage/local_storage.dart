import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final box = GetStorage();

  static void saveToken(String token) {
    box.write('token', token);
  }

  static void saveTokenType(String tokenType) {
    box.write('tokenType', tokenType);
  }

  static void saveUser(String user) {
    box.write('user', user);
  }

  static String? get token => box.read('token');
  static String? get tokenType => box.read('tokenType');
  static String? get user => box.read('user');

  static void clearStorage() {
    box.erase();
  }
}
