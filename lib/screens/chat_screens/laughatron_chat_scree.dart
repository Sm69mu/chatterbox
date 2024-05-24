import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_providers.dart';
import '../../utils/responsive.dart';
import '../../widgets/chat_text_field.dart';

class LaughChatScreen extends StatefulWidget {
  const LaughChatScreen({super.key});

  @override
  State<LaughChatScreen> createState() => _DefaulGeminiChatScreenState();
}

class _DefaulGeminiChatScreenState extends State<LaughChatScreen> {
  TextEditingController messagecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    messagecontroller.dispose();
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
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                ))
          ],
          centerTitle: true,
          title: Text(
            "Chat With Laugh-a-tron",
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: ScaleSize.textScaleFactor(context) * 20),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ChatProviders.inChatMessages.isEmpty
                    ? const Center(
                        child: Text("There are no messages"),
                      )
                    : ListView.builder(
                        itemCount: ChatProviders.inChatMessages.length,
                        itemBuilder: (context, index) {
                          final message = ChatProviders.inChatMessages[index];
                          return ListTile(
                            title: Text(message.message.toString()),
                          );
                        }))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: RoundedTextField(
                ChatProviders: ChatProviders,
                preffixicon: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.add_circle_outline_outlined),
                ),
                suffixicon: InkWell(
                    onTap: () {}, child: const Icon(Icons.mic_none_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FloatingActionButton(
                tooltip: "Send",
                backgroundColor: const Color.fromARGB(255, 232, 232, 232),
                onPressed: () {},
                child: const Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
