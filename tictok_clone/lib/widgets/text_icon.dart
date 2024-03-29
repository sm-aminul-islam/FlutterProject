import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 30,
      child: Stack(
        children: [
          
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 30,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 45, 100),
              borderRadius: BorderRadius.circular(7),
            ),

          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 30,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 215, 234),
              borderRadius: BorderRadius.circular(7),
            ),

          ),

          Center(
            child: Container(
             height: double.infinity,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(Icons.add,color: Colors.black,size: 20,),

            ),
          ),
          
        ],
      ),
    );
  }
}