import 'package:chatterbox/services/firebase_login.dart';

import 'account_screenn.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userDetails = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    String username = await Auth.getUsername();
    setState(() {
      _userDetails = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
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
                          text: _userDetails,
                          style: GoogleFonts.urbanist(
                            fontSize: ScaleSize.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 168, 94, 233),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallActionTile(
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DefaulGeminiChatScreen()));
                  },
                  text: "Chat with text",
                  image: Image.asset("assets/icons/Text ai.png"),
                  color: const Color.fromARGB(255, 103, 51, 102),
                ),
                const SizedBox(
                  height: 10,
                ),
                SmallActionTile(
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DefaulGeminiChatScreen()));
                  },
                  text: "Chat with Image",
                  image: Image.asset(
                    "assets/icons/image_ai.png",
                    fit: BoxFit.contain,
                  ),
                  color: const Color.fromARGB(255, 33, 85, 92),
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
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
