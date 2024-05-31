import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../utils/responsive.dart';
import '../../db/chat_db.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  Box<ChatMessage>? _chatBox;

  @override
  void initState() {
    super.initState();
    _initChatBox();
  }

  Future<void> _initChatBox() async {
    _chatBox = await Hive.openBox<ChatMessage>("chatMessages");
  }

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
      body: FutureBuilder<void>(
        future: _initChatBox(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_chatBox != null && _chatBox!.isNotEmpty) {
            return ListView.builder(
              itemCount: _chatBox!.length,
              itemBuilder: (context, index) {
                final chatMessage = _chatBox!.getAt(index);
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
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
                          chatMessage!.message ??
                              'No message', // Display message
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: ScaleSize.textScaleFactor(context) * 19,
                          ),
                        ),
                        subtitle: Text(
                          "Sample text and chat response",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w500,
                            fontSize: ScaleSize.textScaleFactor(context) * 15,
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
                                      onPressed: () {},
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
                                      onPressed: () {},
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
          } else {
            return const Center(
              child: Text('No chat messages found'),
            );
          }
        },
      ),
    );
  }
}
