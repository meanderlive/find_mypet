import 'package:findmypet/controllers/user_controller.dart';
import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:findmypet/features/auth/presentation/registration_screen.dart';
import 'package:findmypet/features/home/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscureText = true;
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.2),
              child: Text(
                "Log in ",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  color: CAppColors.primaryColor,
                  fontFamily: "almendra",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: CAppColors.buttonColor,
                            fontFamily: "almendra",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        hintText: "email@email.domain",
                        hintStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Enter your email";
                        final emailRegex = RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        return emailRegex.hasMatch(value)
                            ? null
                            : "Invalid email";
                      },
                      onSaved: (value) => email = value!,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: CAppColors.buttonColor,
                            fontFamily: "almendra",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: CAppColors.buttonColor,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: CAppColors.buttonColor,
                                ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: CAppColors.buttonColor),
                        ),
                        hintText: "password",
                        hintStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      obscureText: _obscureText,

                      validator: (value) => value != null && value.length >= 6
                          ? null
                          : "Password must be at least 6 characters",
                      onSaved: (value) => password = value!,
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              color: CAppColors.secondaryColor,
                              fontFamily: "almendra",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.off(() => RegistrationScreen());
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              color: CAppColors.buttonColor,
                              fontFamily: "almendra",
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      child: userController.isloading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: CAppColors.buttonColor,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    await userController.login({
                                      "email": email.trim(),
                                      "password": password.trim(),
                                    });

                                    if (context.mounted) {
                                      Get.snackbar(
                                        "Success",
                                        "Login successful",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                      await Future.delayed(
                                        const Duration(seconds: 1),
                                      );
                                      Get.off(() => MainNavigation());
                                    }
                                  } catch (e, Stacktrace) {
                                    print(e);
                                    print(Stacktrace);
                                    Get.snackbar(
                                      "Failed",
                                      "Failed to login user",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }

                                  print("Email: $email, Password: $password");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CAppColors.buttonColor,
                              ),

                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: Colors.white,
                                  fontFamily: "almendra",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
