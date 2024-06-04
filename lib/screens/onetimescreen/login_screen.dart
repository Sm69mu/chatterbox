import 'package:chatterbox/services/firebase_login.dart';

import '../main_screen.dart';
import '../../utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: ScreenUtils.screenHeight(context) / 3,
                child: LottieBuilder.asset(
                  "assets/animations/new_login_animation.json",
                  height: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Welcome to Chatter Box",
              style: GoogleFonts.urbanist(
                  fontSize: ScaleSize.textScaleFactor(context) * 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
            ),
            Center(
              child: Container(
                width: ScreenUtils.screenWidth(context) - 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(115, 114, 114, 114),
                      Color.fromARGB(255, 78, 69, 37)
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Like talking to a friend, but smarter. Chatterbox Your personal AI assistant for everything",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        fontSize: ScaleSize.textScaleFactor(context) * 19,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Auth.signInwithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: ScreenUtils.screenHeight(context) / 13,
                    width: ScreenUtils.screenWidth(context) / 1.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Login with Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Image.asset(
                          'assets/images/google.256x256.png',
                          width: 40,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
            )
          ],
        ),
      ),
    );
  }
}
