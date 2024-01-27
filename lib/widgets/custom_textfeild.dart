import 'package:chatterbox/constants/color_pallets.dart';
import 'package:flutter/material.dart';

Widget customTextfield({
  String? lableTitle,
  String? hint,
  controllers,
  bool? isPass,
  Icon? icon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: TextFormField(
      controller: controllers,
      obscureText: isPass ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: ColorPallets.purpleColor,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: ColorPallets.purpleColor,
            width: 3.0,
          ),
        ),
        prefixIcon: icon,
        labelText: lableTitle,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        hintText: hint,
      ),
    ),
  );
}
