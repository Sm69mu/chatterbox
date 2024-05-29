import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';

class InferenceWidgetTile extends StatelessWidget {
  const InferenceWidgetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) / 5,
      width: ScreenUtils.screenWidth(context) - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 143, 65, 227),
          Color.fromARGB(255, 79, 45, 144)
        ]),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 10,
              top: 30 ,
              child: SizedBox(
                  height: ScreenUtils.screenHeight(context) / 10,
                  width: ScreenUtils.screenHeight(context) / 10,
                  child: Image.asset("assets/icons/hf-logo.png")))
        ],
      ),
    );
  }
}
