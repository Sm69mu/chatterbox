import 'package:chatterbox/constants/color_pallets.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.amberAccent),
            height: ScreenUtils.screenHeight(context) / 5,
            width: ScreenUtils.screenHeight(context) / 3,
          )
        ],
      ),
    );
  }
}
