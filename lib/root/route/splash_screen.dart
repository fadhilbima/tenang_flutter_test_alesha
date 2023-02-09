import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';
import 'package:tenang_flutter_test/onboarding/screens/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkingOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final valueOnboard = prefs.getBool('skipOnboarding');

    Timer(const Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => valueOnboard == true
              ? LoginPrep()
              : OnboardingPage(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    checkingOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 110),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 10.0],
            colors: [
              Color(0xFF4A80FF).withOpacity(0.9),
              Color(0xFF3462FF),
            ],
          )
        ),
        child: Center(
          child: Image.asset('assets/images/splash.png'),
        ),
      ),
    );
  }
}
