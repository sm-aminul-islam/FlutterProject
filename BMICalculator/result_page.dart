import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'model.dart';

class ResultPage extends StatefulWidget {
  int weight;
  int height;
  int? age;

  ResultPage({required this.weight, required this.height, this.age});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Logic logic = Logic();
  double bmiResult = 0;
  String? result;
  @override
  void initState() {
    // TODO: implement initState
    bmiResult = logic.calculateBMI(widget.height, widget.weight);
    if (bmiResult < 19) {
      result = "YOU are under weight eat more";
    } else if (bmiResult < 24) {
      result = "Your are Nomal weight, Very good";
    } else {
      result = "You are over weight , please eat less";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          "CALCULATION",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "BMI RESULT IS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.amber),
            child: Center(
              child: Text(
                "${bmiResult.toStringAsFixed(1)}",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
