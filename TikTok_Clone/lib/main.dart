import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tictok_clone/constants.dart';
import 'package:tictok_clone/controllers/auth_controller.dart';
import 'package:tictok_clone/screen/add_video_screen.dart';
import 'package:tictok_clone/screen/auth/login_screen.dart';
import 'package:tictok_clone/screen/auth/screen.dart';
import 'package:tictok_clone/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(Authcontroller());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
      
    );
  }
}
