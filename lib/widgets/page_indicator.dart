import 'package:chatterbox/constants/color_pallets.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key, required this.pageCount, required this.currentIndex});
  final int pageCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          pageCount,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 400),
                  height: 5,
                  width: index == currentIndex ? 30 : 10,
                  decoration: BoxDecoration(
                    color: ColorPallets.darkpurpleColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
    );
  }
}
