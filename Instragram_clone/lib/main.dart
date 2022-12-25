import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instragram_flutter/responsive/mobileScreenlayout.dart';
import 'package:instragram_flutter/responsive/responsive.dart';
import 'package:instragram_flutter/responsive/webScreenlayout.dart';
import 'package:instragram_flutter/screen/login_screen.dart';
import 'package:instragram_flutter/screen/signup_screen.dart';
import 'package:instragram_flutter/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      // home: const ResponsiveLayout(
      //   mobileScreenlayout: MobileScreenLayout(),
      //   webScreenlayout: WebScreenLayout(),
      // )
      home: SignupScreen(),
      //LoginScreen(),
    );
  }
}
