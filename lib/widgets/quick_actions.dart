import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionTile extends StatelessWidget {
  const QuickActionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 9, 108, 170)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Image.asset(
              "assets/icons/sound_wave.png",
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            child: Text(
              "Use Voice Commands",
              style: GoogleFonts.lato(
                  height: 1,
                  fontSize: ScaleSize.textScaleFactor(context) * 25,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

class SmallActionTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final color;
  final Image image;
  final String text;
  const SmallActionTile(
      {super.key, this.color, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 10,
      width: ScreenUtils.screenWidth(context) / 2.1,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), color: color),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: image,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                text,
                style: GoogleFonts.lato(
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    fontSize: ScaleSize.textScaleFactor(context) * 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
