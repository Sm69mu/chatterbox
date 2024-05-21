import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChatWidget extends StatelessWidget {
  final List<Color> bgcolor;
  final dynamic icon;
  final String title;
  final String Subtitle;
  const CustomChatWidget({
    Key? key,
    required this.bgcolor,
    required this.icon,
    required this.title,
    required this.Subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) * 0.22,
      width: ScreenUtils.screenWidth(context) / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: bgcolor),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 10,
              child: Container(
                height: ScreenUtils.screenHeight(context) / 6.6,
                width: ScreenUtils.screenWidth(context) / 1.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(0, 53, 104, 85)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: GoogleFonts.urbanist(
                            fontSize: ScaleSize.textScaleFactor(context) * 23,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtils.screenHeight(context) / 35,
                    ),
                    Text(
                      Subtitle,
                      style: GoogleFonts.urbanist(
                          fontSize: ScaleSize.textScaleFactor(context) * 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )),
          Positioned(
            top: 40,
            right: 10,
            child: SizedBox(
              height: ScreenUtils.screenHeight(context) * 0.08,
              width: ScreenUtils.screenHeight(context) * 0.08,
              child: icon,
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtils.screenHeight(context) * 0.05,
                width: ScreenUtils.screenHeight(context) / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 232, 240, 244)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Try Now",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: ScaleSize.textScaleFactor(context) * 16,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: ScreenUtils.screenWidth(context) / 35,
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
