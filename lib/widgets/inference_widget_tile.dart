import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/chat_screens/Infrence_chat_screen/inference_chat_screen.dart';

class InferenceWidgetTile extends StatelessWidget {
  const InferenceWidgetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 5.7,
      width: ScreenUtils.screenWidth(context) - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 143, 65, 227),
          Color.fromARGB(255, 79, 45, 144)
        ]),
      ),
      child: Stack(children: [
        Positioned(
            left: 10,
            top: 30,
            child: SizedBox(
                height: ScreenUtils.screenHeight(context) / 10,
                width: ScreenUtils.screenHeight(context) / 10,
                child: Image.asset("assets/icons/hf-logo.png"))),
        Positioned(
            top: 15,
            left: 80,
            child: Container(
              height: ScreenUtils.screenHeight(context) / 6.6,
              width: ScreenUtils.screenWidth(context) / 1.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(0, 53, 104, 85)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mixtral image generation",
                      style: GoogleFonts.urbanist(
                          fontSize: ScaleSize.textScaleFactor(context) * 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            bottom: 10,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InferenceChatScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtils.screenHeight(context) * 0.06,
                width: ScreenUtils.screenHeight(context) / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 232, 240, 244)),
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
              ),
            ))
      ]),
    );
  }
}
