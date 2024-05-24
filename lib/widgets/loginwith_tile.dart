import 'package:flutter/material.dart';

Widget loginWithtile({Image? image,ontap}) {
  return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: ontap,
    child: Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: const Color.fromARGB(59, 107, 99, 255),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: image,
      ),
    ),
  );
}
