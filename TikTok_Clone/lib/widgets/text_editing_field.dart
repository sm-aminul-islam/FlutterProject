import 'package:flutter/material.dart';
import 'package:tictok_clone/constants.dart';
class TextInputField extends StatelessWidget {
 final TextEditingController controller;
final String labelText;
final bool isobsecure;
final IconData icon;
 
 
  const TextInputField({super.key,required this.controller,required this.labelText, this.isobsecure=false,required this.icon});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: borderColor,
        )
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: borderColor,
        )
      ),
      
    ),
    obscureText: isobsecure,
    );
  }
}