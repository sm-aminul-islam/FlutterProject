import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instragram_flutter/utils/colors.dart';
import 'package:instragram_flutter/widget/text_field_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontoller = TextEditingController();
  final TextEditingController _passcontoller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    _emailcontoller.dispose();
    _passcontoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                //svg image

                SvgPicture.asset(
                  "images/ic_instagram.svg",
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 64,
                ),
                TextFieldControl(
                    textEditingController: _emailcontoller,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Enter Your Email"),
                SizedBox(
                  height: 20,
                ),
                //text for email
                //text for password
                TextFieldControl(
                  textEditingController: _passcontoller,
                  textInputType: TextInputType.text,
                  hintText: "Enter Your Password",
                  ispass: true,
                ),
                SizedBox(
                  height: 20,
                ),

                //login button
                InkWell(
                  child: Container(
                    child: const Text("Log In"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(),
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Don't have an accout?"),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Text(
                          "Sign up.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
