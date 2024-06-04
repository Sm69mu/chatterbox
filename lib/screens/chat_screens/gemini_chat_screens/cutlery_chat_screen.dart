import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../gemini/gemini_system_insturction.dart';
import '../../../providers/gemini_chat_providers.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/def_chat_page.dart';
import '../../../widgets/message_widget.dart';
import '../../../widgets/chat_text_field.dart';

class CutleryChatScreen extends StatefulWidget {
  const CutleryChatScreen({super.key});

  @override
  State<CutleryChatScreen> createState() => _DefaulGeminiChatScreenState();
}

class _DefaulGeminiChatScreenState extends State<CutleryChatScreen> {
  TextEditingController messagecontroller = TextEditingController();
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
            "Chat With Cutlery",
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
                        bgcolor: Color.fromARGB(64, 185, 193, 36),
                        title: "The Cutlery",
                        logoimg: "assets/icons/chef.png",
                        descrp:
                            "Cutlery is the ultimate recipe generator LLM, whipping up delicious dishes from cuisines worldwide! 🌎🍜 With recipe suggestions, cooking guides, and smart ingredient substitutions, SavvyChef turns meal prep into a gourmet adventure. 🥗✨",
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
                      messageController: messagecontroller)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  tooltip: "Send",
                  backgroundColor: Color.fromARGB(214, 225, 184, 34),
                  onPressed: () {
                    if (pickedImage != null) {
                      ChatProviders.sendMessageToGemini(
                        context,
                        pickedImage!,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.cutlery,
                      );
                    } else {
                      ChatProviders.sendMessageToGemini(
                        context,
                        messagecontroller.text,
                        "gemini-1.5-flash",
                        GeminiSystemInsturction.cutlery,
                      );
                    }
                    if (pickedImage != null) {
                      pickedImage = null;
                    }
                    messagecontroller.clear();
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
