import 'package:chatterbox/screens/onetimescreen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/firebase_login.dart';
import '../../utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _userDetails = "Loading...";
  String _useremail = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    String username = await Auth.getUsername();
    String useremail = await Auth.getUseremail();
    setState(() {
      _useremail = useremail;
      _userDetails = username;
    });
  }

  final Uri _feedbackUrl =
      Uri.parse('https://www.linkedin.com/in/heysoumyajitmukherjee/');

  final Uri _reportUrl =
      Uri.parse('https://github.com/Sm69mu/chatterbox/issues');

  Future<void> _feedbackurl() async {
    if (!await launchUrl(_feedbackUrl)) {
      throw Exception('Could not launch $_feedbackUrl');
    }
  }

  Future<void> _report() async {
    if (!await launchUrl(_reportUrl)) {
      throw Exception('Could not launch $_reportUrl');
    }
  }

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
              height: ScreenUtils.screenHeight(context) / 8.8,
              width: ScreenUtils.screenWidth(context) - 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(121, 33, 149, 243),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: ScreenUtils.screenWidth(context) / 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _userDetails,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: ScaleSize.textScaleFactor(context) * 17),
                      ),
                      Text(
                        _useremail,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: ScaleSize.textScaleFactor(context) * 14),
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
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(80, 33, 149, 243),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: _feedbackurl,
                  child: ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: Icon(Icons.feedback_outlined,
                        size: ScreenUtils.screenWidth(context) / 15),
                    title: Text(
                      "Feedback",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: ScaleSize.textScaleFactor(context) * 20),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                InkWell(
                  onTap: _report,
                  child: ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    leading: Icon(Icons.report_gmailerrorred,
                        size: ScreenUtils.screenWidth(context) / 15),
                    title: Text(
                      "Report issue",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: ScaleSize.textScaleFactor(context) * 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtils.screenHeight(context) / 10,
          ),
          InkWell(
            onTap: () async {
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Container(
              height: ScreenUtils.screenHeight(context) / 12,
              width: ScreenUtils.screenHeight(context) / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 229, 229, 229)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Logout",
                    style: GoogleFonts.urbanist(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScaleSize.textScaleFactor(context) * 18),
                  ),
                  const Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
