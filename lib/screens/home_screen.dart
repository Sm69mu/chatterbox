import 'package:chatterbox/constants/lists.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:chatterbox/widgets/ai_service_card.dart';
import 'package:chatterbox/widgets/quick_actions.dart';
import 'package:chatterbox/widgets/specific_action_tile.dart';
import 'package:chatterbox/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage:
                                AssetImage("assets/images/profile-image.jpg"),
                          ),
                          SizedBox(
                            width: ScreenUtils.screenWidth(context) * 0.03,
                          ),
                          Text('Soumyajit Mukherjee',
                              style: GoogleFonts.urbanist(
                                  fontSize:
                                      ScaleSize.textScaleFactor(context) * 20,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'He,Ask me something 👋',
                style: GoogleFonts.urbanist(
                    fontSize: ScaleSize.textScaleFactor(context) * 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SwiperWidget(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child:
                          InkWell(onTap: () {}, child: const QuickActionTile()),
                    )),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SmallActionTile(
                        text: "Text Generate",
                        image: Image.asset("assets/icons/Text ai.png"),
                        color: const Color.fromARGB(255, 103, 51, 102),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SmallActionTile(
                        text: "Image Generator",
                        image: Image.asset(
                          "assets/icons/image_ai.png",
                          fit: BoxFit.contain,
                        ),
                        color: const Color.fromARGB(255, 33, 85, 92),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 15,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  " Action Shortcuts ",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: ScaleSize.textScaleFactor(context) * 26),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    specifictileicons.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Specificactiontile(
                              backgroundimg: tilebackgrndimgs[index],
                              icon: Image.asset(specifictileicons[index]),
                              title: tiletitle[index]),
                        )),
              ),
            ),
            SizedBox(
              height: ScreenUtils.screenHeight(context) / 10,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Choose Your prefered LLM",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.bold,
                        fontSize: ScaleSize.textScaleFactor(context) * 25),
                  ),
                ),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: AIServiceCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: AIServiceCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: AIServiceCard(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
