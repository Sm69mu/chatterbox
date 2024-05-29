import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfarenceChatProvider extends ChangeNotifier {
  

  Future<Uint8List> query(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(
          "https://api-inference.huggingface.co/models/TheMistoAI/MistoLine"),
      headers: {
        "Authorization": "Bearer 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",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      return bytes;
    } else {
      throw Exception('Failed to load image: ${response.statusCode}');
    }
  }

  Future<void> main() async {
    final result = await query({"inputs": "Astronaut riding a horse"});
    print(result);
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