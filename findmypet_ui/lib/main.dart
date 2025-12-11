// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:findmypet/controllers/user_controller.dart';
import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:findmypet/features/auth/presentation/login_screen.dart';
import 'package:findmypet/features/home/navigation/main_navigation.dart';
import 'package:findmypet/features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final userController = Get.put(UserController());
  final isloggedIn = await userController.loadUserFromStorage();
  runApp(MyApp(isloggedIn: isloggedIn));
}

class MyApp extends StatelessWidget {
  final bool isloggedIn;
  const MyApp({Key? key, required this.isloggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'find-my-pet',
      theme: ThemeData(
        scaffoldBackgroundColor: CAppColors.accentColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: CAppColors.accent4Color,
          foregroundColor: CAppColors.buttonColor,
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(islogedIn: isloggedIn),
    );
  }
}
