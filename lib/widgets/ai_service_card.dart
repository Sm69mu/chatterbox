import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AIServiceCard extends StatefulWidget {
  const AIServiceCard({super.key});

  @override
  State<AIServiceCard> createState() => _AIServiceCardState();
}

class _AIServiceCardState extends State<AIServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 4.5,
      width: ScreenUtils.screenWidth(context) - 30,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: ScreenUtils.screenHeight(context) / 15,
                width: ScreenUtils.screenWidth(context) / 9,
                child: Image.asset(
                  "assets/images/google-bard-icon.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Bard",
                style: GoogleFonts.lato(
                    fontSize: ScaleSize.textScaleFactor(context) * 25,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
