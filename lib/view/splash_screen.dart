import 'dart:async';
import 'package:chilli/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Scaffold(
          body: Column(
            children: [
              Image.asset('assets/image/splash.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,)
            ],
          ),
        )
    );
  }
}
