import '../../constants/color_pallets.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              "Register to Chatter Box",
              style: GoogleFonts.urbanist(
                  fontSize: ScaleSize.textScaleFactor(context) * 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              child: customTextfield(
                  lableTitle: "Email",
                  hint: "Enter Your Email",
                  icon: const Icon(
                    Icons.email,
                    color: ColorPallets.purpleColor,
                  )),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              child: customTextfield(
                  isPass: true,
                  lableTitle: 'Password',
                  hint: "Enter Your Password",
                  icon: const Icon(
                    Icons.password_outlined,
                    color: ColorPallets.purpleColor,
                  )),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              child: customTextfield(
                  isPass: true,
                  lableTitle: 'Confirm Password',
                  hint: "Confirm Your Password",
                  icon: const Icon(
                    Icons.password_outlined,
                    color: ColorPallets.purpleColor,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: SizedBox(
                height: ScreenUtils.screenHeight(context) / 12,
                child: SlideAction(
                  sliderButtonIconSize: ScreenUtils.screenHeight(context) / 37,
                  sliderButtonIconPadding: 15,
                  animationDuration: const Duration(milliseconds: 600),
                  text: "Slide to Login",
                  textStyle: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white),
                  outerColor: const Color.fromARGB(255, 89, 82, 211),
                  elevation: 0,
                  borderRadius: 18.5,
                  onSubmit: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: GoogleFonts.urbanist(
                        fontSize: ScaleSize.textScaleFactor(context) * 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.urbanist(
                        fontSize: ScaleSize.textScaleFactor(context) * 17,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
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
