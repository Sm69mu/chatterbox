import 'package:chatterbox/constants/lists.dart';
import 'package:chatterbox/screens/chat_screens/defaul_gemini_chat_screen.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/custom_textfeild.dart';
import 'package:chatterbox/widgets/quick_actions.dart';
import 'package:chatterbox/widgets/Custom_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String username = "Soumyajit Mukherejee";
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage:
                                AssetImage("assets/images/profile-image.jpg"),
                          ),
                          SizedBox(
                            width: ScreenUtils.screenWidth(context) * 0.03,
                          ),
                          Text(username,
                              style: GoogleFonts.urbanist(
                                  fontSize:
                                      ScaleSize.textScaleFactor(context) * 20,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) * 0.17,
              width: ScreenUtils.screenWidth(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hey, ',
                          style: GoogleFonts.urbanist(
                            fontSize: ScaleSize.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: username,
                          style: GoogleFonts.urbanist(
                            fontSize: ScaleSize.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(
                                255, 168, 94, 233), // Highlight color
                          ),
                        ),
                        TextSpan(
                          text: ' Ask me something 👋',
                          style: GoogleFonts.urbanist(
                            fontSize: ScaleSize.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: QuickActionTile(),
                    )),
                Column(
                  children: [
                    SmallActionTile(
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const DefaulGeminiChatScreen()));
                      },
                      text: "Chat with text",
                      image: Image.asset("assets/icons/Text ai.png"),
                      color: const Color.fromARGB(255, 103, 51, 102),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SmallActionTile(
                      ontap: () {},
                      text: "Chat with Image",
                      image: Image.asset(
                        "assets/icons/image_ai.png",
                        fit: BoxFit.contain,
                      ),
                      color: const Color.fromARGB(255, 33, 85, 92),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) * 0.08,
              width: ScreenUtils.screenWidth(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    " Choose Your custom model ",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.bold,
                        fontSize: ScaleSize.textScaleFactor(context) * 26),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CustomChatWidget(
                    bgcolor: const [
                       Color.fromARGB(255, 10, 149, 137),
                       Color.fromARGB(255, 99, 145, 135)
                    ],
                    icon: Image.asset("assets/icons/robot.png"),
                    title: "Cyclops",
                    Subtitle:
                        " The AI that helps you write better code, faster.",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomChatWidget(
                      bgcolor: const [
                        Color.fromARGB(255, 136, 119, 83),
                        Color.fromARGB(136, 199, 228, 160)
                      ],
                      icon: Image.asset("assets/icons/chef.png"),
                      title: "Flavor Finder",
                      Subtitle:
                          "I'm not just a chatbot, I'm your personal chef."),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomChatWidget(
                      bgcolor: const [
                        Color.fromARGB(255, 174, 93, 236),
                        Color.fromARGB(180, 230, 69, 255)
                      ],
                      icon: Image.asset("assets/icons/watch.png"),
                      title: "Laugh-a-tron",
                      Subtitle: "I'm the AI you can laugh at (and with).")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
