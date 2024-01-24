import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/animations/Animation - 1706110538041.json",
              height: 300,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
           Text(
            "Welcome to Chatter Box",
            style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
