import 'package:chatterbox/screens/onetimescreen/login_screen.dart';
import 'package:chatterbox/utils/page_bulider_method.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentpage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentpage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_image.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              PageBuilder(
                  animationPath: 'assets/animations/robot_animation.json',
                  title: "Welcome To ChatterBox",
                  subtitle:
                      'Here You can Access all the advanced LLm tools in one place'),
              UniquePageBuider(
                  uniqueAnimationPath:
                      'assets/animations/gemini_animation.json',
                  uniqueTitle: 'All AI Tools in one place',
                  uniqueSubTitle:
                      "Use the power of different ai tool and utilize it to increase your productivity",
                  uniqueAnimationPath2:
                      'assets/animations/chat_gpt_animation.json'),
              PageBuilder(
                  animationPath: 'assets/animations/ai_person_animation.json',
                  title: "Utilize the Power of Ai",
                  subtitle:
                      "Utilize the power of ai in Your day to day actiity and enhance your productivity")
            ],
            onPageChanged: (index) {
              setState(() {
                currentpage = index;
              });
              setState(() {
                isLastPage = (index == 2);
              });
            },
          ),
          Positioned(
              top: 60,
              left: ScreenUtils.screenWidth(context) - 100,
              // right: 20,
              child: isLastPage
                  ? const Text("")
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                        ),
                      ))),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  PageIndicator(pageCount: 3, currentIndex: currentpage),
                  isLastPage
                      ? SizedBox(
                          height: 60,
                          width: 150,
                          child: FloatingActionButton(
                              backgroundColor: Colors.purple[800],
                              elevation: 3,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Get Started",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              )),
                        )
                      : FloatingActionButton(
                          backgroundColor: Colors.purple[800],
                          elevation: 3,
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ))
        ],
      ),
    ));
  }
}
