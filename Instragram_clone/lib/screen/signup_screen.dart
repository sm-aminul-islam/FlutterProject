import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instragram_flutter/resource/auth_methods.dart';
import 'package:instragram_flutter/utils/colors.dart';
import 'package:instragram_flutter/utils/utils.dart';
import 'package:instragram_flutter/widget/text_field_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontoller = TextEditingController();
  final TextEditingController _passcontoller = TextEditingController();
  final TextEditingController _biocontoller = TextEditingController();
  final TextEditingController _namecontoller = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose

    _emailcontoller.dispose();
    _passcontoller.dispose();
    _biocontoller.dispose();
    _namecontoller.dispose();
  }

  void selectImage() async {
    Uint8List _im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = _im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible(
                  //   child: Container(),
                  //   flex: 2,
                  // ),
                  //svg image

                  SvgPicture.asset(
                    "images/ic_instagram.svg",
                    color: primaryColor,
                  ),

                  const SizedBox(
                    height: 64,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/id/1313110704/vector/default-avatar-photo-placeholder-profile-icon.jpg?s=612x612&w=0&k=20&c=WbpeZFUeHvhwYEA07qEMqTU1Bsxc9O9ShlXYofbhqx0="),
                            ),
                      Positioned(
                          bottom: -8,
                          left: 60,
                          child: IconButton(
                            onPressed: (() {}),
                            icon: Icon(Icons.add_a_photo),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldControl(
                      textEditingController: _emailcontoller,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter Your Email"),
                  SizedBox(
                    height: 20,
                  ),

                  //text for email

                  TextFieldControl(
                      textEditingController: _namecontoller,
                      textInputType: TextInputType.text,
                      hintText: "Enter Your Name"),
                  SizedBox(
                    height: 20,
                  ),

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
                  TextFieldControl(
                      textEditingController: _biocontoller,
                      textInputType: TextInputType.text,
                      hintText: "Enter Your Biodata"),
                  SizedBox(
                    height: 20,
                  ),

                  //login button
                  InkWell(
                    onTap: () async {
                      String res = await AuthMethods().signUpUserI(
                          email: _emailcontoller.text,
                          password: _passcontoller.text,
                          username: _namecontoller.text,
                          bio: _biocontoller.text,
                          file: _image!);
                      print(res);
                    },
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
                    height: 120,
                  ),
                  // Flexible(
                  //   child: Container(),
                  //   flex: 3,
                  // ),
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
      ),
    );
  }
}
