import '../utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineAiTile extends StatelessWidget {
  final dynamic ontap;
  const OfflineAiTile({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: ontap,
      child: Container(
        height: ScreenUtils.screenHeight(context) / 10,
        width: ScreenUtils.screenWidth(context) - 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 95, 96, 80),
              Color.fromARGB(255, 103, 103, 103)
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Upload Your LLm",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: ScaleSize.textScaleFactor(context) * 18),
                ),
                Text(
                  "use .gguf file from your local system",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: ScaleSize.textScaleFactor(context) * 15),
                )
              ],
            ),
            const Icon(
              Icons.upload_outlined,
              color: Colors.white,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
