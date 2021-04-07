import 'package:assembly/bindings/auth_binding.dart';
import 'package:assembly/controllers/auth_controller.dart';
import 'package:assembly/pages.dart';
import 'package:assembly/screens/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      home: DashboardPage(),
    );
  }
}
