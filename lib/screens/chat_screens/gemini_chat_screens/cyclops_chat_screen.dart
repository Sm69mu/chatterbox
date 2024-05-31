import 'package:chatterbox/widgets/def_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../gemini/gemini_system_insturction.dart';
import '../../../widgets/message_widget.dart';
import '../../../providers/gemini_chat_providers.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/chat_text_field.dart';

class CyclopsChatScreen extends StatefulWidget {
  const CyclopsChatScreen({super.key});
  @override
  State<CyclopsChatScreen> createState() => _CyclopsChatScreenState();
}

class _CyclopsChatScreenState extends State<CyclopsChatScreen> {
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
            " Chat With Cyclops ",
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
                        bgcolor: Color.fromARGB(44, 24, 255, 255),
                        title: "The Cyclops",
                        logoimg: "assets/icons/robot.png",
                        descrp:
                            "Cyclops is the ultimate code generator LLM,  turbocharging your development process! 🚀 With intelligent code completion, automated documentation, and bug-busting capabilities, Cyclops is your trusty sidekick for cleaner, faster, and smarter code. 💻✨",
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[900]),
          child: Row(
            children: [
              Expanded(
                  child: ChatTextField(
                      barcolor: Color.fromARGB(255, 18, 194, 179),
                      pickedImage: pickedImage,
                      ontap_mic: () {},
                      ontap_img: () async {
                        pickedImage = await ChatProviders.pickImage();
                      },
                      messageController: messageController)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  tooltip: "Send",
                  backgroundColor: Color.fromARGB(255, 18, 194, 179),
                  onPressed: () {
                    // Handle message sending
                    if (pickedImage != null) {
                      // Send the image
                      ChatProviders.sendMessageToGemini(
                        context,
                        pickedImage!,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.cyclops,
                      );
                    } else {
                      // Send the text message
                      ChatProviders.sendMessageToGemini(
                        context,
                        messageController.text,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.cyclops,
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
