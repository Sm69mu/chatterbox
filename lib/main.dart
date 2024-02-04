import 'package:chatterbox/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      //TODO make a proper themeing property

      theme: ThemeData.dark(
        useMaterial3: true,
      ),

      //TODO make one time ob screen & proper routes

      home: const OnboardingScreen(),
    );
  }
}
