import 'package:chatterbox/utils/responsive.dart';
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
    const List chatcount = [2,4,5,6,7,8];
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Chats",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ListView.builder(
          itemCount: chatcount.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtils.screenHeight(context)*0.1,
                width: ScreenUtils.screenWidth(context)-30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(146, 88, 44, 164),
                  borderRadius: BorderRadius.circular(15)),
                child:  ListTile(
                  title: Text("Sample text"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bookmark_add),
                      SizedBox(width: ScreenUtils.screenWidth(context)*0.07,),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
