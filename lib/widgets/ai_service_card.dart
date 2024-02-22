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
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 68, 77, 84),
                Color.fromARGB(255, 39, 49, 39)
              ]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bard",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: ScaleSize.textScaleFactor(context) * 25),
            ),
            Image.asset(
              height: ScreenUtils.screenHeight(context) / 20,
              width: ScreenUtils.screenWidth(context) / 7,
              "assets/images/google-bard-icon.png",
              fit: BoxFit.contain,
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: ScreenUtils.screenHeight(context) / 25,
          width: ScreenUtils.screenWidth(context) / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/icons/chat 1.png",
                fit: BoxFit.contain,
              ),
              Image.asset(
                "assets/icons/edit 1.png",
                fit: BoxFit.contain,
              ),
              Image.asset(
                "assets/icons/scan (1) 1.png",
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          height: ScreenUtils.screenHeight(context) / 30,
          width: double.infinity,
          child: Text(
            " Api key -",
            style: GoogleFonts.lato(fontWeight: FontWeight.normal),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: ScreenUtils.screenHeight(context) / 20,
                width: ScreenUtils.screenWidth(context) / 1.5,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            Image.asset(
              width: ScreenUtils.screenWidth(context) / 15,
              height: ScreenUtils.screenHeight(context) / 22,
              "assets/icons/correct.png",
              fit: BoxFit.contain,
            ),
          ],
        ),
      ]),
    );
  }
}
