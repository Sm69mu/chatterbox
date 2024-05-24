import 'providers/chat_providers.dart';
import 'screens/onetimescreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ChatProviders.initHive();

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
