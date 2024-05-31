import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/responsive.dart';

class InferenceChatScreen extends StatefulWidget {
  const InferenceChatScreen({super.key});

  @override
  State<InferenceChatScreen> createState() => _InferenceChatScreenState();
}

class _InferenceChatScreenState extends State<InferenceChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mixtarl Image Generation",
          style: GoogleFonts.urbanist(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border))
        ],
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: (){
            
          }, child: Text("send")),
          SizedBox(
            height: ScreenUtils.screenHeight(context) / 10,
          )
        ],
      ),
    );
  }
}
