import 'package:assembly/bindings/auth_binding.dart';
import 'package:assembly/controllers/auth_controller.dart';

import 'package:assembly/screens/dashboard_page.dart';
import 'package:assembly/screens/login_page.dart';
import 'package:assembly/uitls/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'models/hive_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // AuthBinding().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      home: DashboardPage(),
    );
  }
}

class Nav extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.change()),
    );
  }
}
