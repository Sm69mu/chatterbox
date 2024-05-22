import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaulGeminiChatScreen extends StatelessWidget {
  const DefaulGeminiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: "Save Chat",
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
              ))
        ],
        centerTitle: true,
        title: Text(
          "Chat With Gemini",
          style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w700,
              fontSize: ScaleSize.textScaleFactor(context) * 20),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
