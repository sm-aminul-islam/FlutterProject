import 'package:flutter/material.dart';
import 'package:tictok_clone/constants.dart';
import 'package:tictok_clone/widgets/text_editing_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
              const Text("Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              SizedBox(
                height: 25,
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
                height: 25,
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
                height: 25,
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
                    "Login",
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
                    'Don\'t have an account ?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Ready ");
                    },
                    child: Text(
                      'Register',
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
