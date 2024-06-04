// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatTextField extends StatelessWidget {

  final dynamic ontap_img;
  final TextEditingController messageController;
  final XFile? pickedImage;

  const ChatTextField(
      {super.key,
      required this.messageController,
       this.ontap_img,
      this.pickedImage,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: messageController,
          decoration: InputDecoration(
            prefixIcon: pickedImage != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(File(pickedImage!.path)),
                  )
                : IconButton(
                    onPressed: ontap_img,
                    icon: const Icon(Icons.add_circle_outline_rounded),
                  ),
            
            hintText: 'Type your message...',
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
