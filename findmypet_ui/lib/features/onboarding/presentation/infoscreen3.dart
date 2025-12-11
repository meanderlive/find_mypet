import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:flutter/material.dart';

class Infoscreen3 extends StatelessWidget {
  const Infoscreen3({super.key});

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
                image: DecorationImage(
                  image: AssetImage("assets/images/mainPhoto.png"),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Text(
                "\"Bring pets back home where they belong — together, we can!\"",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: "almendra",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.12,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.14),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CAppColors.accent3Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontFamily: "almendra",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Center(
    //         child: Text(
    //           ""Bring pets back home where they belong — together, we can!"",
    //         ),
    //       ),
    //       Positioned(
    //         child: ElevatedButton(onPressed: () {}, child: Text("Get Started")),
    //       ),
    //     ],
    //   ),
    // );
  }
}
