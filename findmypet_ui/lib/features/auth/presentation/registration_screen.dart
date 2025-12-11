import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:findmypet/domain/auth_services.dart';
import 'package:findmypet/features/auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _obscureText = true;
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
                "Register",
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
                          "Name",
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
                        hintText: "name",
                        hintStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter your name"
                          : null,
                      onSaved: (value) => name = value!,
                    ),

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
                            "Already have an account?",
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
                            Get.off(() => LoginScreen());
                          },
                          child: Text(
                            "Login",
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
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            try {
                              await AuthServices.register({
                                "name": name,
                                "email": email.trim(),
                                "password": password.trim(),
                              });

                              if (context.mounted) {
                                Get.snackbar(
                                  "Success",
                                  "User registered successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                Get.off(() => LoginScreen());
                              }
                            } catch (e) {
                              Get.snackbar(
                                "Failed",
                                "Failed to register user",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CAppColors.buttonColor,
                        ),

                        child: Text(
                          "Register",
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
