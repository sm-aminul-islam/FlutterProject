import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000 + 10000000).toString());

    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMettingButton(
              onpressed: createNewMeeting,
              text: "New Meeting",
              icon: Icons.videocam,
            ),
            HomeMettingButton(
              onpressed: () => joinMeeting(context),
              text: "join Meeting",
              icon: Icons.add_box_rounded,
            ),
            HomeMettingButton(
              onpressed: () {},
              text: "Schedle Meeting",
              icon: Icons.calendar_today,
            ),
            HomeMettingButton(
              onpressed: () {},
              text: "Share Screen",
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            "Create / Join Meeting with just a Click!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ))
      ],
    );
  }
}
