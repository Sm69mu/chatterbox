import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefChatPage extends StatelessWidget {
  final String logoimg;
  final String title;
  final String descrp;
  final Color? bgcolor;
  const DefChatPage(
      {super.key,
      required this.logoimg,
      required this.title,
      required this.descrp,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 1.5,
      width: ScreenUtils.screenWidth(context) - 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: bgcolor),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 110,
            child: SizedBox(
              width: ScreenUtils.screenWidth(context) / 3,
              child: Image.asset(
                logoimg,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 100,
            child: Text(
              title,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: ScaleSize.textScaleFactor(context) * 27),
            ),
          ),
          Positioned(
            top: 210,
            left: 20,
            child: Container(
              width: ScreenUtils.screenWidth(context) - 70,
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Text(
                  descrp,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: ScaleSize.textScaleFactor(context) * 17),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
