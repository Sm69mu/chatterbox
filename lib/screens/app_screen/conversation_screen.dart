import 'package:chatterbox/providers/gemini_chat_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../db/chat_db.dart';
import '../../widgets/message_widget.dart';

class ConversationScreen extends StatefulWidget {
  final String conversationId;
  const ConversationScreen({super.key, required this.conversationId});
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    final messages = await ChatProviders.fetchMessages(context);
    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Conversation",
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _messages.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUsermsg,
                  message: message.message,
                  image: message.image != null ? message.image as XFile : null,
                  date: message.date.toString(),
                );
              },
            ),
    );
  }
}
