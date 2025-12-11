import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:flutter/material.dart';

class Infoscreen2 extends StatelessWidget {
  const Infoscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CAppColors.accentColor,
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Image.asset("assets/images/foot1.png"),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Image.asset("assets/images/foot2.png"),
          ),
          Center(
            child: Container(
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: CAppColors.accen2tColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(126),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Post ",
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontFamily: "almendra",
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,

                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: "about missing pets and ",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontFamily: "almendra",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: "connect with people",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontFamily: "almendra",
                        fontWeight: FontWeight.w700,

                        color: CAppColors.accentColor,
                      ),
                    ),
                    TextSpan(
                      text: " who can help.",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontFamily: "almendra",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
