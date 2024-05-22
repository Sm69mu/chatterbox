import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionTile extends StatelessWidget {
  const QuickActionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: ScreenUtils.screenHeight(context) * 0.23,
        width: ScreenUtils.screenWidth(context) / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 9, 108, 170)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Image.asset(
                "assets/icons/sound_wave.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              child: Text(
                "Use Voice Commands",
                style: GoogleFonts.urbanist(
                    height: 1,
                    fontSize: ScaleSize.textScaleFactor(context) * 19,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallActionTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final color;
  final ontap;
  final Image image;
  final String text;
  const SmallActionTile(
      {super.key,
      this.color,
      required this.image,
      required this.text,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ontap,
      child: Container(
        height: ScreenUtils.screenHeight(context) / 10,
        width: ScreenUtils.screenWidth(context) / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(ScreenUtils.screenHeight(context) / 45),
              child: image,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Text(
                  text,
                  style: GoogleFonts.urbanist(
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontSize: ScaleSize.textScaleFactor(context) * 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
