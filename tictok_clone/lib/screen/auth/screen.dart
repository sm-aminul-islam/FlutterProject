import 'package:flutter/material.dart';
import 'package:tictok_clone/constants.dart';
import 'package:tictok_clone/controllers/auth_controller.dart';
import 'package:tictok_clone/widgets/text_editing_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TikTok",
                style: TextStyle(
                    fontSize: 35,
                    color: buttonCoor,
                    fontWeight: FontWeight.w900),
              ),
              const Text("Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () => authcontroller.pickImage(),
                        icon: Icon(Icons.add_a_photo)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _usercontroller,
                  labelText: "Username",
                  icon: Icons.email,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _emailcontroller,
                  labelText: "Email",
                  icon: Icons.email,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _passwordcontroller,
                  labelText: "Passward",
                  icon: Icons.lock,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonCoor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Center(
                  child: Text(
                    "UserName",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have an account ?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () => authcontroller.registerUser(
                        _usercontroller.text,
                        _emailcontroller.text,
                        _passwordcontroller.text,
                        authcontroller.profilePhoto),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: buttonCoor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
