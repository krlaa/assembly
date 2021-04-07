import 'package:assembly/env/env.dart';
import 'package:assembly/models/hive_store.dart';
import 'package:assembly/models/user_model.dart';
import 'package:assembly/screens/dashboard_page.dart';
import 'package:assembly/screens/login_page.dart';
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
    //     signedIn.listen((val) {
    //   !val ? Get.offAll(LoginPage()) : Get.offAll(Worked());
    // });
    super.onInit();
  }

  void change() {
    signedIn.toggle();
  }

  void signIn(email, password) async {
    try {
      await _firebaseAuth.signIn(email, password);
      _user = await _firebaseAuth.getUser();
      Get.snackbar("Welcome", _user.email);
      Get.to(DashboardPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
// {localId: ES4gRs5ontaGsUJVVFrBaHQaGJ93, displayName: null, photoUrl: null, email: kevin@gmail.com, emailVerified: false}
