// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  final dynamic suffixicon;
  final dynamic preffixicon;
  final dynamic ChatProviders;

  const RoundedTextField({
    Key? key,
    required this.suffixicon,
    this.preffixicon,
   required this.ChatProviders,
  }) : super(key: key);

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  final TextFeildfoucusNode = FocusNode();

  final Textcontroller = TextEditingController();

  @override
  void dispose() {
    TextFeildfoucusNode.dispose();
    Textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: const Color.fromARGB(255, 187, 187, 187), width: 2),
      ),
      child: TextField(
        focusNode: TextFeildfoucusNode,
        textInputAction: TextInputAction.send,
        controller: Textcontroller,
        onSubmitted: (String value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: widget.preffixicon,
          suffixIcon: widget.suffixicon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
