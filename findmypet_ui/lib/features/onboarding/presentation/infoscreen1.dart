import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:flutter/material.dart';

class Infoscreen1 extends StatelessWidget {
  const Infoscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Lost or found a ",
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontFamily: "almendra",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: "pet",
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontFamily: "almendra",
                            fontWeight: FontWeight.w700,

                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "You’re in the right place.",
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      fontFamily: "almendra",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
