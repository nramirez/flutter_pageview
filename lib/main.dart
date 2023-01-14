import 'package:flutter/material.dart';
import 'package:flutter_pageview/home.dart';
import 'package:flutter_pageview/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final seenOnboarding = preferences.getBool('seenOnboarding') ?? false;
  runApp(MyApp(
    seenOnboarding: seenOnboarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding});
  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PageView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: seenOnboarding ? const Home() : const OnboardingScreen(),
    );
  }
}
