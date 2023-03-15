import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/controllers/auth_controller.dart';
import 'package:tictok_clone/screen/add_video_screen.dart';

const backgroundColor = Colors.black;
const pages = [
  Text("Home Screen"),
  Text("Search Screen"),
 AddVideoScreen(),
  Text('Message Screen'),
  Text('Profile Screen')
];

var buttonCoor = Colors.red;
const borderColor = Colors.grey;

//Firebase
var firebaseauth = FirebaseAuth.instance;
var firebasestorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authcontroller = Authcontroller.instance;
