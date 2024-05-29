import 'dart:developer';

import 'package:aub_ai/aub_ai.dart';
import 'package:aub_ai/prompt_template.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class OfflineChatProvider extends ChangeNotifier {
  static String? filePath;
  static String outputByAI = '';
  final List<String> messages = [];

  static Future<void> pickAndSelectGGUFFile(
      OfflineChatProvider provider) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      // allowedExtensions: ['gguf'],
    );
    if (result != null && result.files.single.path != null) {
      filePath = result.files.single.path;
      provider.notifyListeners();
    }
  }

  static Future<void> sendMessageToAI(
      String promptByUser, OfflineChatProvider provider) async {
    if (filePath == null) {
      return;
    }
    final promptTemplate = PromptTemplate.chatML().copyWith(
      prompt: promptByUser,
    );
    await talkAsync(
      filePathToModel: filePath!,
      promptTemplate: promptTemplate,
      onTokenGenerated: (String token) {
        outputByAI += token;
        provider.notifyListeners();
      },
    );
    provider.messages.add(promptByUser);
    provider.messages.add(outputByAI.trim());
    outputByAI = '';
    log(outputByAI);
    provider.notifyListeners();
  }
}
