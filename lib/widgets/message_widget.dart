import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Message {
  final bool isUser;
  final String? message;
  final XFile? image;
  final DateTime date;

  Message({
    required this.isUser,
    this.message,
    this.image,
    required this.date,
  });
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String? message;
  final XFile? image;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    this.message,
    this.image,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15)
          .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
      decoration: BoxDecoration(
        color: isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            Image.file(
              File(image!.path),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          if (message != null)
            Text(
              message!,
              style: TextStyle(
                fontSize: 16,
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
