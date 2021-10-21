import 'dart:convert';

import 'package:assembly/env/env.dart';
import 'package:assembly/models/hive_store.dart';
import 'package:assembly/models/user_model.dart';
import 'package:assembly/screens/dashboard_page.dart';
import 'package:assembly/screens/login_page.dart';
import 'package:deta_pack/deta_pack.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:firedart/firedart.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth;
  Rx<bool> signedIn = Rx<bool>(false);
  User _user;

  @override
  void onInit() async {
    _firebaseAuth = FirebaseAuth.initialize(Env.key, VolatileStore());
    signedIn.bindStream(_firebaseAuth.signInState);
    signedIn.listen((val) {
      print(val);
      if (val) {
        Get.offAll(DashboardPage());
      } else {
        Get.offAll(LoginPage());
        Get.defaultDialog(
            title: "Error", content: Text("You are not logged in"));
      }
    });

    super.onInit();
  }

  void change() {
    signedIn.toggle();
  }

  @override
  void dispose() {
    signedIn.close();
    super.dispose();
  }

  void signIn(email, password) async {
    try {
      await _firebaseAuth.signIn(email, password);
      _user = await _firebaseAuth.getUser();
      Get.snackbar("Welcome", _user.email);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}
// {localId: ES4gRs5ontaGsUJVVFrBaHQaGJ93, displayName: null, photoUrl: null, email: kevin@gmail.com, emailVerified: false}
