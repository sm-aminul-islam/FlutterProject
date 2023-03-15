import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictok_clone/constants.dart';
import 'package:tictok_clone/models/user.dart' as model;
import 'package:tictok_clone/screen/auth/login_screen.dart';
import 'package:tictok_clone/screen/home_screen.dart';

class Authcontroller extends GetxController {
  static Authcontroller instance = Get.find();

  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get profilePhoto => _pickedImage.value;
  void onReady() {
    super.onReady();
    _user = Rx(firebaseauth.currentUser);
    _user.bindStream(firebaseauth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() =>  HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture",
          "You have successfully selected your profile picture");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebasestorage
        .ref()
        .child('Profilepics')
        .child(firebaseauth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downurl = await snap.ref.getDownloadURL();
    return downurl;
  }

  void registerUser(
      String username, String email, String passward, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          passward.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseauth.createUserWithEmailAndPassword(
            email: email, password: passward);

        String downurl = await _uploadToStorage(image);

        model.User user = model.User(
            email: email,
            name: username,
            uid: cred.user!.uid,
            profilePhoto: downurl);
        firestore.collection('user').doc(cred.user!.uid).set(user.toJson());
      } else {
        Get.snackbar("Error creating Account", "Please Enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error creating Account", e.toString());
    }
  }
}
