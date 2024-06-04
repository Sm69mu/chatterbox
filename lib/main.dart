import 'package:chatterbox/firebase_options.dart';
import 'package:chatterbox/screens/main_screen.dart';
import 'package:chatterbox/screens/onetimescreen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'providers/gemini_chat_providers.dart';
import 'db/chat_db.dart';
import 'providers/fusion_brain_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.openBox<ChatConversation>('chatConversations');
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(ChatConversationAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatProviders()),
      ChangeNotifierProvider(create: (context) => FusionBrainProvider()),
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const LoginScreen();
            } else {
              return const MainScreen();
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
