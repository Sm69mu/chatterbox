import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/quick_actions.dart';
import 'package:chatterbox/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SizedBox(
                  height: 34,
                  width: 34,
                  child: Image.asset(
                    "assets/icons/menu_icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: CircleAvatar(
                  radius: 26,
                  child: Image.asset("assets/images/google.256x256.png"),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Hey, Soumyajit Ask me something 👋',
              style: GoogleFonts.lato(
                  fontSize: ScaleSize.textScaleFactor(context) * 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SwiperWidget(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: QuickActionTile(),
                  )),
              Column(
                children: [
                  SmallActionTile(
                    text: "Text Generate",
                    image: Image.asset("assets/icons/Text ai.png"),
                    color: Color.fromARGB(255, 2, 64, 95),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SmallActionTile(
                    text: "Image Generator",
                    image: Image.asset("assets/icons/image-AI2.png"),
                    color: Color.fromARGB(255, 33, 85, 92),
                  )
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
