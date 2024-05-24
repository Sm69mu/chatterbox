import '../../utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: use chat length here
    const List chatcount = [2, 4, 5, 6, 7, 8];
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Saved Chats",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ListView.builder(
          itemCount: chatcount.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtils.screenHeight(context) * 0.1,
                  width: ScreenUtils.screenWidth(context) - 30,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(146, 88, 44, 164),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    //TODO:implement wrapping text
                    title: Text(
                      "Sample text",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: ScaleSize.textScaleFactor(context) * 19,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.bookmark_add),
                            )),
                        SizedBox(
                          width: ScreenUtils.screenWidth(context) * 0.07,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
