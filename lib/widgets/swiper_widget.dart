import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({Key? key}) : super(key: key);

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.deepPurple,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Image.asset(
                    "assets/icons/text.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Image.asset(
                    "assets/icons/scanner.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: InkWell(
            onTap: () {},
            onLongPress: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              height: 90,
              width: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/Microphone (voice).png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
