import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Specificactiontile extends StatelessWidget {
  const Specificactiontile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 5,
      width: ScreenUtils.screenWidth(context) / 2.5,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/background_image.jpg",
            fit: BoxFit.contain,
          ),
          Text(
            "Code generator",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: ScaleSize.textScaleFactor(context) * 20,
            ),
          ),
        ],
      ),
    );
  }
}
