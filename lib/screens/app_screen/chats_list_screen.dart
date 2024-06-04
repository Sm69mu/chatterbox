import 'package:chatterbox/providers/gemini_chat_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../db/chat_db.dart';
import '../../utils/responsive.dart';
import 'conversation_screen.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Saved Chats",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<ChatConversation>>(
          future: ChatProviders.saveChat(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final conversations = snapshot.data!;
              return ListView.builder(
                itemCount: conversations.length,
                itemBuilder: (context, index) {
                  final conversation = conversations[index];
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: ScreenUtils.screenWidth(context) - 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(146, 88, 44, 164),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: ScreenUtils.screenHeight(context) / 30,
                            vertical: ScreenUtils.screenHeight(context) / 60,
                          ),
                          title: Text(
                            conversation.messages.isNotEmpty
                                ? conversation.messages.first.message ??
                                    'No message'
                                : 'No message',
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: ScaleSize.textScaleFactor(context) * 19,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          children: [
                            SizedBox(
                              height: ScreenUtils.screenHeight(context) / 10,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              159, 228, 125, 125),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          ChatProviders.deleteConversation(
                                              context, index);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Delete",
                                              style: GoogleFonts.urbanist(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              223, 25, 117, 163),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ConversationScreen(
                                                conversationId:
                                                    conversation.toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "View",
                                              style: GoogleFonts.urbanist(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
