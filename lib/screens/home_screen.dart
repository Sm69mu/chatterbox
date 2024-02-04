import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/ai_service_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //TODO refine the home page according to the DRAFT1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: ScreenUtils.screenHeight(context) / 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        iconSize: ScreenUtils.screenHeight(context) / 25,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu_outlined,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: ScreenUtils.screenHeight(context) / 35,
                        child: Image.asset("assets/images/google.256x256.png"), //TODO change the icon to user profile
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 15,
              child: Text(
                'Hey Soumyajit, What can I do 👋',     //TODO show user name
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: ScaleSize.textScaleFactor(context) * 21),
              ),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: ScreenUtils.screenHeight(context) / 15,
                    width: ScreenUtils.screenWidth(context) / 1.6,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                      child: Container(
                    height: ScreenUtils.screenHeight(context) / 10,
                    width: ScreenUtils.screenWidth(context) / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ))
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.amberAccent),
                    height: ScreenUtils.screenHeight(context) / 4,
                    width: ScreenUtils.screenHeight(context) / 4.5,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        height: ScreenUtils.screenHeight(context) / 8.5,
                        width: ScreenUtils.screenHeight(context) / 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green),
                        height: ScreenUtils.screenHeight(context) / 8.5,
                        width: ScreenUtils.screenHeight(context) / 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Selece Your LLM service',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: ScaleSize.textScaleFactor(context) * 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const AIServiceCard(
              
            )
          ],
        ),
      ),
    );
  }
}
