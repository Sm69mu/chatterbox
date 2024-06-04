import 'dart:typed_data';

import 'package:chatterbox/providers/fusion_brain_provider.dart';
import 'package:chatterbox/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FusionBrainScreen extends StatefulWidget {
  const FusionBrainScreen({super.key});
  @override
  State<FusionBrainScreen> createState() => _FusionBrainScreenState();
}

class _FusionBrainScreenState extends State<FusionBrainScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mixtarl Image Generation",
          style: GoogleFonts.urbanist(),
        ),
      ),
      body: Center(
        child: Consumer<FusionBrainProvider>(
          builder: (context, provider, child) {
            return FutureBuilder<Uint8List>(
              future: FusionBrainProvider.generate("Image of a dog", context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Image.memory(snapshot.data!);
                } else {
                  return Container();
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(child: ChatTextField(messageController: messageController)),
          FloatingActionButton(
            onPressed: () {
              FusionBrainProvider.generate(messageController.text, context);
              messageController.clear();
            },
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  // Widget brainFusion() {
  //   return FutureBuilder<Uint8List>(
  //     future: FusionBrainProvider.generate(messageController.text, context),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const CircularProgressIndicator();
  //       } else if (snapshot.hasError) {
  //         return Text('Error: ${snapshot.error}');
  //       } else if (snapshot.hasData) {
  //         return Image.memory(snapshot.data!);
  //       } else {
  //         return Container();
  //       }
  //     },
  //   );
  // }
}
