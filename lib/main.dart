import 'package:chatterbox/providers/offline_chat_provider.dart';
import 'package:chatterbox/screens/app_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/gemini_chat_providers.dart';
import 'screens/onetimescreen/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // try {
  //   await ChatProviders.initHive();
  // } catch (e) {
  //   log('Error initializing Hive: $e' as num);
  // }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatProviders()),
      ChangeNotifierProvider(create: (context) => OfflineChatProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
