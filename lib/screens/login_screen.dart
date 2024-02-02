import 'package:chatterbox/constants/color_pallets.dart';
import 'package:chatterbox/screens/home_screen.dart';
import 'package:chatterbox/screens/register_screen.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/custom_textfeild.dart';
import 'package:chatterbox/widgets/loginwith_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background_image.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
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
                  style: GoogleFonts.lato(
                      fontSize: ScaleSize.textScaleFactor(context) * 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: ScreenUtils.screenHeight(context) / 9,
                  child: customTextfield(
                      lableTitle: "Email",
                      hint: "Enter Your Email",
                      icon: const Icon(
                        Icons.email,
                        color: ColorPallets.purpleColor,
                      )),
                ),
                SizedBox(
                  height: ScreenUtils.screenHeight(context) / 9,
                  child: customTextfield(
                      isPass: true,
                      lableTitle: 'Password',
                      hint: "Enter Your Password",
                      icon: const Icon(
                        Icons.password_outlined,
                        color: ColorPallets.purpleColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            'Forget password',
                            style: GoogleFonts.lato(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: SizedBox(
                    height: ScreenUtils.screenHeight(context) / 11,
                    child: SlideAction(
                      sliderButtonIconSize:
                          ScreenUtils.screenHeight(context) / 30,
                      sliderButtonIconPadding: 15,
                      animationDuration: const Duration(milliseconds: 600),
                      text: "Slide to Login",
                      textStyle: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white),
                      outerColor: Color.fromARGB(255, 89, 82, 211),
                      elevation: 0,
                      borderRadius: 18.5,
                      onSubmit: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ScreenUtils.screenWidth(context) / 6,
                      height: ScreenUtils.screenHeight(context) / 12.5,
                      child: loginWithtile(
                          image: Image.asset(
                        'assets/images/google.256x256.png',
                      )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: ScreenUtils.screenWidth(context) / 6,
                      height: ScreenUtils.screenHeight(context) / 12.5,
                      child: loginWithtile(
                          image: Image.asset(
                              'assets/images/facebook-color.256x256.png')),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New to Chatter Box ? ',
                        style: GoogleFonts.lato(
                            fontSize: ScaleSize.textScaleFactor(context) * 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Register',
                        style: GoogleFonts.lato(
                            fontSize: ScaleSize.textScaleFactor(context) * 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
