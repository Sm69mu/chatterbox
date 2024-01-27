import 'package:chatterbox/constants/color_pallets.dart';
import 'package:chatterbox/screens/register_screen.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
              style:
                  GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            customTextfield(
                lableTitle: "Email",
                hint: "Enter Your Email",
                icon: const Icon(
                  Icons.email,
                  color: ColorPallets.purpleColor,
                )),
            customTextfield(
                isPass: true,
                lableTitle: 'Password',
                hint: "Enter Your Password",
                icon: const Icon(
                  Icons.password_outlined,
                  color: ColorPallets.purpleColor,
                )),
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
              child: SlideAction(
                text: "Slide to Login",
                textStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white),
                outerColor: const Color.fromARGB(255, 126, 120, 253),
                elevation: 0,
                borderRadius: 18.5,
                onSubmit: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginWithtile(
                    image: Image.asset(
                  'assets/images/google.256x256.png',
                  fit: BoxFit.contain,
                )),
                const SizedBox(
                  width: 30,
                ),
                loginWithtile(
                    image:
                        Image.asset('assets/images/facebook-color.256x256.png'))
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
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
