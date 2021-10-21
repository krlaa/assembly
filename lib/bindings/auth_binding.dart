import 'package:assembly/controllers/auth_controller.dart';
import 'package:assembly/screens/dashboard_page.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(DashboardController(), permanent: true);
  }
}
