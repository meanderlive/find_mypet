import 'dart:convert';

import 'package:findmypet/data/user_model.dart';
import 'package:findmypet/domain/auth_services.dart';
import 'package:findmypet/features/auth/presentation/login_screen.dart';
import 'package:findmypet/local_storage/local_storage.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rxn<UserModel> _user = Rxn<UserModel>();
  UserModel? get user => _user.value;
  String? token;
  String? tokenType;
  RxBool isloading = false.obs;

  void setUser(UserModel userModel, String token, String tokenType) {
    _user.value = userModel;
    this.token = token;
    this.tokenType = tokenType;
    update();
  }

  Future<bool> loadUserFromStorage() async {
    final storedToken = LocalStorage.token;
    final storedTokenType = LocalStorage.tokenType;
    final storedUser = LocalStorage.user;

    if (storedToken != null && storedTokenType != null && storedUser != null) {
      setUser(
        UserModel.fromMap(jsonDecode(storedUser)),
        storedToken,
        storedTokenType,
      );
      return true;
    }

    return false;
  }

  Future<void> login(Map<String, dynamic> body) async {
    isloading.value = true;
    update();

    try {
      final response = await AuthServices.login(body);
      print("$response");
      print(body);

      /// Storage on app load
      setUser(
        UserModel.fromMap({'email': body['email']}),
        response['token'],
        response['tokenType'],
      );
      // local storage
      LocalStorage.saveToken(response['token']);
      LocalStorage.saveTokenType(response['tokenType']);
      LocalStorage.saveUser(jsonEncode({'email': body['email']}));

      update();
    } finally {
      isloading.value = false;
      update();
    }
  }

  ///logout
  void logout() {
    _user.value = null;
    token = null;
    tokenType = null;

    LocalStorage.clearStorage(); // assuming you have a clear method
    update();

    // Optional: Navigate to login screen
    Get.offAll(() => LoginScreen());
  }
}
