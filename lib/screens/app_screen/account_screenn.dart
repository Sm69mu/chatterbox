import 'package:chatterbox/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Account",
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: ScreenUtils.screenHeight(context) / 8,
              width: ScreenUtils.screenWidth(context) - 10,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(121, 33, 149, 243),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: ScreenUtils.screenWidth(context) / 10,
                      backgroundImage:
                          const AssetImage("assets/images/profile-image.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtils.screenWidth(context) / 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Soumyajit Mukherjee",
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: ScaleSize.textScaleFactor(context) * 20),
                      ),
                      Text(
                        "soumyajitmukherjee271@gmail.com",
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: ScaleSize.textScaleFactor(context) * 17),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtils.screenHeight(context) / 15,
          ),
          Container(
            width: ScreenUtils.screenWidth(context) - 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(80, 33, 149, 243),
            ),
            child: Column(
              children: [
                ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.feedback_outlined,
                      size: ScreenUtils.screenWidth(context) / 15),
                  title: Text(
                    "Feedback",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: ScaleSize.textScaleFactor(context) * 22),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  leading: Icon(Icons.report_gmailerrorred,
                      size: ScreenUtils.screenWidth(context) / 15),
                  title: Text(
                    "Report issue",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: ScaleSize.textScaleFactor(context) * 22),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  leading: Icon(Icons.info,
                      size: ScreenUtils.screenWidth(context) / 15),
                  title: Text(
                    "Credits",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: ScaleSize.textScaleFactor(context) * 22),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtils.screenHeight(context) / 10,
          ),
          Container(
            height: ScreenUtils.screenHeight(context) / 12,
            width: ScreenUtils.screenHeight(context) / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Logout",
                  style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: ScaleSize.textScaleFactor(context) * 20),
                ),
                Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
