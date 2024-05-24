import '../screens/app_screen/account_screenn.dart';
import '../screens/app_screen/chats_list_screen.dart';
import '../screens/app_screen/home_screen.dart';
import 'package:flutter/material.dart';

List<IconData> listOfIcons = [
  Icons.home_outlined,
  Icons.bookmark_border_outlined,
  Icons.person_2_outlined,
];

List<String> listOfStrings = [
  'Home',
  'Saved',
  'Account',
];

List<Widget> listofpage = const [
  HomeScreen(),
  ChatsScreen(),
  AccountScreen(),
];
