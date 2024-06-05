import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart'; // Import for generating UUIDs

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
  static Box<ChatConversation>? chatBox;
  static TextEditingController controller = TextEditingController();
  static final conversationId = const Uuid().v4();
  static List<ChatMessage> conversationMessages = [];

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
          maxOutputTokens: 800,
        ),
        systemInstruction: Content.system(systemInstruction),
      );
      if (input is String) {
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
          throw Exception('No response generated by the model.');
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

  static Future<List<ChatMessage>> fetchMessages(BuildContext context) async {
    final provider = Provider.of<ChatProviders>(context, listen: false);
    if (chatBox == null) {
      await Hive.initFlutter();
      chatBox = await Hive.openBox<ChatConversation>('chatConversations');
    }
    try {
      final conversations = chatBox!.values
          .where((conversation) => conversation.messages.isNotEmpty)
          .toList();
      return conversations
          .expand((conversation) => conversation.messages)
          .toList();
    } catch (e) {
      log('Error fetching messages from Hive: $e');
      provider.notifyListeners();
    }
    return [];
  }

  static Future<List<ChatConversation>> saveChat(BuildContext context) async {
    final provider = Provider.of<ChatProviders>(context, listen: false);
    if (chatBox == null) {
      await Hive.initFlutter();
      chatBox = await Hive.openBox<ChatConversation>('chatConversations');
    }
    try {
      final conversation = ChatConversation(
        conversationId: conversationId,
        messages: await Future.wait(messages.map((message) async {
          final imageBytes =
              message.image != null ? await message.image!.readAsBytes() : null;
          return ChatMessage(
            isUsermsg: message.isUser,
            message: message.message,
            image: imageBytes,
            date: message.date,
            conversationId: conversationId,
          );
        }).toList()),
      );
      await chatBox!.add(conversation);
      log('Chat successfully saved to Hive!');
      provider.notifyListeners();
    } catch (e) {
      log('Error saving chat to Hive: $e');
    } finally {
      provider.notifyListeners();
    }
    return chatBox!.values
        .where((conversation) => conversation.messages.isNotEmpty)
        .toList();
  }


  static Future<void> deleteConversation(
      BuildContext context, int index) async {
    final provider = Provider.of<ChatProviders>(context, listen: false);
    if (chatBox == null) {
      await Hive.initFlutter();
      chatBox = await Hive.openBox<ChatConversation>('chatConversations');
    }
    try {
      final conversation = chatBox!.getAt(index);
      if (conversation != null) {
        await chatBox!.deleteAt(index);
        log('Conversation successfully deleted from Hive!');
        provider.notifyListeners();
      }
    } catch (e) {
      log('Error deleting conversation from Hive: $e');
    } finally {
      provider.notifyListeners();
    }
  }

}