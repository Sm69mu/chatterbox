import '../../widgets/inference_widget_tile.dart';
import '../chat_screens/gemini_chat_screens/roughai_chat_screen.dart';
import '../chat_screens/gemini_chat_screens/laughatron_chat_scree.dart';
import '../chat_screens/gemini_chat_screens/cutlery_chat_screen.dart';
import '../chat_screens/gemini_chat_screens/cyclops_chat_screen.dart';
import '../chat_screens/gemini_chat_screens/defaul_gemini_chat_screen.dart';
import '../../utils/responsive.dart';
import '../../widgets/quick_actions.dart';
import '../../widgets/custom_chat_widget.dart';

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
                            radius: 22,
                            foregroundImage:
                                AssetImage("assets/images/profile-image.jpg"),
                          ),
                          SizedBox(
                            width: ScreenUtils.screenWidth(context) * 0.03,
                          ),
                          Text(username,
                              style: GoogleFonts.urbanist(
                                  fontSize:
                                      ScaleSize.textScaleFactor(context) * 18,
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
                            fontWeight: FontWeight.w500,
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
                            fontWeight: FontWeight.w500,
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
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    " Choose Your custom model ",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: ScaleSize.textScaleFactor(context) * 21),
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
                  Hero(
                    tag: "Cyclops",
                    child: customChatModelwidget(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CyclopsChatScreen()));
                      },
                      bgcolor: const [
                        Color.fromARGB(255, 10, 149, 137),
                        Color.fromARGB(255, 111, 167, 154)
                      ],
                      icon: Image.asset("assets/icons/robot.png"),
                      title: "Cyclops",
                      subtitle: " The AI that helps you write better code.",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Hero(
                    tag: "Cutlery",
                    child: customChatModelwidget(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CutleryChatScreen()));
                        },
                        bgcolor: const [
                          Color.fromARGB(255, 136, 119, 83),
                          Color.fromARGB(136, 199, 228, 160)
                        ],
                        icon: Image.asset("assets/icons/chef.png"),
                        title: " Cutlery",
                        subtitle:
                            "I'm not just a chatbot, I'm your personal chef."),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Hero(
                    tag: "Laugh-a-tron",
                    child: customChatModelwidget(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LaughChatScreen()));
                        },
                        bgcolor: const [
                          Color.fromARGB(180, 0, 115, 209),
                          Color.fromARGB(255, 49, 130, 153),
                        ],
                        icon: Image.asset("assets/icons/glasses.png"),
                        title: "Laugh-a-tron",
                        subtitle: "I'm the AI you can laugh at (and with)."),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Hero(
                    tag: "Rough-AI",
                    child: customChatModelwidget(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RoughAiChatScreen()));
                        },
                        bgcolor: const [
                          Color.fromARGB(180, 184, 11, 25),
                          Color.fromARGB(255, 134, 90, 122),
                        ],
                        icon: Image.asset("assets/icons/evil.png"),
                        title: "Rough-AI",
                        subtitle: "I'm the AI you can laugh at (and with)."),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Use LLm from Hugging Face",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: ScaleSize.textScaleFactor(context) * 20),
                  ),
                ),
              ),
            ),
            InferenceWidgetTile()
          ],
        )),
      ),
    );
  }
}
