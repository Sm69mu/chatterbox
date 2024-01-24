import 'package:flutter/material.dart';
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
          const Text(
            "Welcome to Chatter Box",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}
