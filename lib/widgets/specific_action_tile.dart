import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Specificactiontile extends StatelessWidget {
  final dynamic backgroundimg;
  final Image icon;
  final String title;

  const Specificactiontile({
    Key? key,
    required this.backgroundimg,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) *0.23,
      width: ScreenUtils.screenWidth(context) / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(backgroundimg),
          fit: BoxFit.cover,
        ),
        color: Colors.grey[900],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: ScreenUtils.screenHeight(context) *0.1,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: ScaleSize.textScaleFactor(context) * 19,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: SizedBox(
              height: ScreenUtils.screenHeight(context)*0.08,
              width: ScreenUtils.screenHeight(context)*0.08,
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
