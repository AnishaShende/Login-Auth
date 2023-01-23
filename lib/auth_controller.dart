import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/SignUpPage.dart';
import 'package:logindemo/Welcome.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: const Text(
            "Account creation failed!",
            style: TextStyle(color: Colors.white38),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white54),
          ));
    }
  }

  login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About login", "login message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: const Text(
            "Login failed!",
            style: TextStyle(color: Colors.white38),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white54),
          ));
    }
  }

  logOut() async {
    await auth.signOut();
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    // ? because there might be user or might not be user
    _intialScreens(User? user) {
      if (user == null) {
        Get.offAll(() => const SignUpPage());
      } else {
        Get.offAll(() => const Welcome());
      }
      //whenever things with user changes like login or logout this function will be notified
    }

    ever(_user, _intialScreens);
  }
}
