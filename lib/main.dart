import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'providers/gemini_chat_providers.dart';
import 'db/chat_db.dart';
import 'screens/onetimescreen/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path); 
  Hive.registerAdapter(ChatMessageAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatProviders()),
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
      home: const OnboardingScreen(),
    );
  }
}
