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
                  width: ScreenUtils.screenWidth(context) - 30,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(146, 88, 44, 164),
                      borderRadius: BorderRadius.circular(15)),
                  child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(
                          horizontal: ScreenUtils.screenHeight(context) / 30,
                          vertical: ScreenUtils.screenHeight(context) / 60),
                      title: Text(
                        "Sample text and chat response ",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: ScaleSize.textScaleFactor(context) * 19,
                        ),
                      ),
                      subtitle: Text("Sample text and chat response  ",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w500,
                            fontSize: ScaleSize.textScaleFactor(context) * 15,
                          )),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      children: [
                        SizedBox(
                          height: ScreenUtils.screenHeight(context) / 10,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Delete"),
                                          Icon(Icons.delete_forever_outlined)
                                        ],
                                      )),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("View"),
                                        Icon(Icons.arrow_forward)
                                      ],
                                    )),
                              ))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
