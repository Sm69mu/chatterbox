import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../db/chat_db.dart';
import '../gemini/gemini_api_key.dart';
import '../widgets/message_widget.dart';

class ChatProviders extends ChangeNotifier {
  static const String apiKey = geminApiKey;
  List<XFile>? image = [];
  static List<Message> messages = [];
  static late final ChatSession chatSession;
  static late final GenerativeModel? model;
  static bool isLoading = false;
  static  Box<ChatMessage>? chatBox;
  static TextEditingController controller = TextEditingController();

  static GenerativeModel initModel(
    String modelname,
  ) {
    return GenerativeModel(
      model: modelname,
      apiKey: geminApiKey,
    );
  }

  void clearChat() {
    messages.clear();
    notifyListeners();
  }

  static Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<String> sendMessageToGemini(
    BuildContext context,
    dynamic input,
    String modelName,
    String systemInstruction,
  ) async {
    final provider = Provider.of<ChatProviders>(context, listen: false);
    ChatProviders.isLoading = true;
    provider.notifyListeners();

    try {
      final model = GenerativeModel(
        model: modelName,
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.9,
          topP: 0.1,
          topK: 16,
          maxOutputTokens: 700,
        ),
        systemInstruction: Content.system(systemInstruction),
      );
      if (input is String) {
        // Handle text input
        ChatProviders.messages.add(
          Message(isUser: true, message: input, date: DateTime.now()),
        );
        final contenttext = [Content.text(input)];
        final response = await model.generateContent(contenttext);
        log(response.text!);
        if (response.text != null) {
          ChatProviders.messages.add(
            Message(
                isUser: false, message: response.text!, date: DateTime.now()),
          );
          provider.notifyListeners();
          return response.text!;
        } else {
          throw Exception('No text generated by the model.');
        }
      } else if (input is XFile) {
        // Handle image input
        final imageBytes = await input.readAsBytes();
        final imageUint8List = Uint8List.fromList(imageBytes);
        ChatProviders.messages.add(
          Message(isUser: true, image: input, date: DateTime.now()),
        );
        final content = [
          Content.multi([
            TextPart('What is this ?'),
            DataPart('image/png', imageUint8List),
          ])
        ];
        final response = await model.generateContent(content);
        log(response.text!);
        if (response.text != null) {
          ChatProviders.messages.add(
            Message(
                isUser: false, message: response.text!, date: DateTime.now()),
          );
          provider.notifyListeners();
          return response.text!;
        } else {
          throw Exception('No text generated by the model.');
        }
      } else {
        throw Exception('Invalid input type');
      }
    } catch (e) {
      log('Error: $e');
      ChatProviders.isLoading = false;
      provider.notifyListeners();
      rethrow;
    }
  }

  //   void _initChatBox() async {
  //   await Hive.initFlutter();
  //   _chatBox = await Hive.openBox<ChatMessage>('chat_box');
  // }

  static Future<void> saveChat(BuildContext context) async {
    final provider = Provider.of<ChatProviders>(context, listen: false);
    chatBox = Hive.box<ChatMessage>('chatMessages');
    try {
      ChatProviders.chatBox = await Hive.openBox<ChatMessage>("chatMessages");
      for (var message in messages) {
        final chatMessage = ChatMessage(
          isUser: message.isUser,
          message: message.message,
          image:
              message.image != null ? await message.image!.readAsBytes() : null,
          date: message.date,
        );
        await ChatProviders.chatBox!.add(chatMessage); // Use chatBox to add
      }
      log('Chat successfully saved to Hive!');
    } catch (e) {
      log('Error saving chat to Hive: $e');
    } finally {
      provider.notifyListeners();
    }
  }
}
