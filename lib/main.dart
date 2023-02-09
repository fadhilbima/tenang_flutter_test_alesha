import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_flutter_test/login/bloc/login_bloc.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';
import 'package:tenang_flutter_test/onboarding/screens/onboarding_page.dart';
import 'package:tenang_flutter_test/register/screens/register_page.dart';
import 'package:tenang_flutter_test/root/route/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}