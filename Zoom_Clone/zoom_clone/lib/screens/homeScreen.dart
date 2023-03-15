import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/himeeting_screen.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int page = 0;
  onPageChanged(int _page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Logged out', onpressed:()=>AuthMethods().SignOut() )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: MeetingScreen(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: page,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Char '),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Contacts '),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings '),
          ]),
    );
  }
}
