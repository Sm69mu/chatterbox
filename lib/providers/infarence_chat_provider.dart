import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class InfarenceChatProvider extends ChangeNotifier {
  static Uint8List? imageBytes;

  static Future<void> query(String prompt, BuildContext context) async {
    final provider = Provider.of<InfarenceChatProvider>(context, listen: false);
    final response = await http.post(
      Uri.parse(
          "https://api-inference.huggingface.co/models/TheMistoAI/MistoLine"),
      headers: {
        "Authorization": "Bearer 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",
      },
      body: jsonEncode({"inputs": prompt}),
    );
    if (response.statusCode == 200) {
      imageBytes = response.bodyBytes;
      provider.notifyListeners();
    } else {
      throw Exception('Failed to load image: ${response.statusCode}');
    }
  }
}





















// async function query(data) {
// 	const response = await fetch(
// 		"https://api-inference.huggingface.co/models/TheMistoAI/MistoLine",
// 		{
// 			headers: { Authorization: "Bearer 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" },
// 			method: "POST",
// 			body: JSON.stringify(data),
// 		}
// 	);
// 	const result = await response.blob();
// 	return result;
// }
// query({"inputs": "Astronaut riding a horse"}).then((response) => {
// 	// Use image
// });