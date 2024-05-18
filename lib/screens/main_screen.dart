import 'package:chatterbox/constants/lists.dart';
import 'package:chatterbox/screens/account_screen.dart';
import 'package:chatterbox/screens/chats_screen.dart';
import 'package:chatterbox/screens/home_screen.dart';
import 'package:chatterbox/screens/saved_screen.dart';
import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentIndex = 0;
  List<Widget> listofpage = const [
    HomeScreen(),
    ChatsScreen(),
    SavedScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listofpage[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(ScreenUtils.screenWidth(context) * .05),
        height: ScreenUtils.screenWidth(context) * .155,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.screenWidth(context) * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? ScreenUtils.screenWidth(context) * .32
                      : ScreenUtils.screenWidth(context) * .15,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex
                        ? ScreenUtils.screenWidth(context) * .12
                        : 0,
                    width: index == currentIndex
                        ? ScreenUtils.screenWidth(context) * .32
                        : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? Colors.white : Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? ScreenUtils.screenWidth(context) * .31
                      : ScreenUtils.screenWidth(context) * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? ScreenUtils.screenWidth(context) * .13
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style:  GoogleFonts.urbanist(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? ScreenUtils.screenWidth(context) * .03
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: ScreenUtils.screenWidth(context) * .076,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
