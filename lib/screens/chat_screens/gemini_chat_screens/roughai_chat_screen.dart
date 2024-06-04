import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../gemini/gemini_system_insturction.dart';
import '../../../providers/gemini_chat_providers.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/chat_text_field.dart';
import '../../../widgets/def_chat_page.dart';
import '../../../widgets/message_widget.dart';

class RoughAiChatScreen extends StatefulWidget {
  const RoughAiChatScreen({super.key});

  @override
  State<RoughAiChatScreen> createState() => _DefaulGeminiChatScreenState();
}

class _DefaulGeminiChatScreenState extends State<RoughAiChatScreen> {
  TextEditingController messageController = TextEditingController();
  late ChatProviders _chatProvider;
  XFile? pickedImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _chatProvider = Provider.of<ChatProviders>(context, listen: false);
  }

  @override
  void dispose() {
    Future.delayed(Duration.zero, () {
      _chatProvider.clearChat();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProviders>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                tooltip: "Save Chat",
                onPressed: () {
                  ChatProviders.saveChat(context);
                },
                icon: const Icon(
                  Icons.bookmark,
                ))
          ],
          centerTitle: true,
          title: Text(
            "Chat With Rough-AI",
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: ScaleSize.textScaleFactor(context) * 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ChatProviders.messages.isEmpty
                  ? const Center(
                      child: DefChatPage(
                        bgcolor: Color.fromARGB(64, 188, 32, 32),
                        title: "Rough-AI",
                        logoimg: "assets/icons/evil.png",
                        descrp:
                            "Rough AI is the ultimate idea generator LLM, ready to spark your creativity with raw, unpolished brilliance! 💡⚡ With bold brainstorming, edgy concepts, and off-the-wall ideas, Rough AI breaks the mold and pushes boundaries. 🌟✏️",
                      ),
                    )
                  : ListView.builder(
                      reverse: false,
                      itemCount: ChatProviders.messages.length,
                      itemBuilder: (context, index) {
                        final message = ChatProviders.messages[index];
                        return Messages(
                          isUser: message.isUser,
                          message: message.message,
                          image: message.image,
                          date: message.date.toString(),
                        );
                      },
                    ),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[900]),
          child: Row(
            children: [
              Expanded(
                  child: ChatTextField(
                      pickedImage: pickedImage,
                      ontap_img: () async {
                        pickedImage = await ChatProviders.pickImage();
                      },
                      messageController: messageController)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  tooltip: "Send",
                  backgroundColor: Color.fromARGB(255, 228, 90, 90),
                  onPressed: () {
                    // Handle message sending
                    if (pickedImage != null) {
                      // Send the image
                      ChatProviders.sendMessageToGemini(
                        context,
                        pickedImage!,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.roughai,
                      );
                    } else {
                      // Send the text message
                      ChatProviders.sendMessageToGemini(
                        context,
                        messageController.text,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.roughai,
                      );
                    }
                    if (pickedImage != null) {
                      pickedImage = null;
                    }
                    messageController.clear();
                  },
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
