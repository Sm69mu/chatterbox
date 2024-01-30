import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageBuilder extends StatelessWidget {
  final String animationPath;
  final String title;
  final String subtitle;

  const PageBuilder(
      {super.key,
      required this.animationPath,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            animationPath,
            height: 290,
            width: 290,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.lato(
                fontSize: ScaleSize.textScaleFactor(context) * 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: GoogleFonts.lato(
                fontSize: ScaleSize.textScaleFactor(context) * 15,
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class UniquePageBuider extends StatelessWidget {
  final String uniqueAnimationPath;
  final String uniqueAnimationPath2;
  final String uniqueTitle;
  final String uniqueSubTitle;

  const UniquePageBuider(
      {super.key,
      required this.uniqueAnimationPath,
      required this.uniqueTitle,
      required this.uniqueSubTitle,
      required this.uniqueAnimationPath2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(uniqueAnimationPath, height: 150, width: 150),
          Lottie.asset(uniqueAnimationPath2, height: 150, width: 150),
          const SizedBox(
            height: 20,
          ),
          Text(uniqueTitle,
              style: GoogleFonts.lato(
                  fontSize: ScaleSize.textScaleFactor(context) * 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Text(
            uniqueSubTitle,
            style: GoogleFonts.lato(
                fontSize: ScaleSize.textScaleFactor(context) * 15,
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
