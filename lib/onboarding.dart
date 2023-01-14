import 'package:flutter/material.dart';
import 'package:flutter_pageview/home.dart';
import 'package:flutter_pageview/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          OnboardingPage(
            title: 'Bienvenidos',
            subtitle: 'a la app de la diversion',
            image: 'assets/1.jpeg',
          ),
          OnboardingPage(
            title: 'Primera regla',
            subtitle: 'respeta',
            image: 'assets/2.jpeg',
          ),
          OnboardingPage(
            title: 'Segunda regla',
            subtitle: 'llega a tiempo',
            image: 'assets/3.jpeg',
          ),
          OnboardingPage(
            title: 'Tercera regla',
            subtitle: 'disfruta',
            image: 'assets/4.jpeg',
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () {
              if (_pageController.page == 3) {
                SharedPreferences.getInstance().then((preferences) {
                  preferences.setBool('seenOnboarding', true);
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
