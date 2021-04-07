import 'package:assembly/controllers/auth_controller.dart';
import 'package:assembly/main.dart';
import 'package:get/get.dart';

class FormX extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;

  RxString errorTextEmail = RxString(null);
  RxString errorTextPassword = RxString(null);

  Rx<Function> submitFunc = Rx<Function>(null);

  @override
  void onInit() {
    super.onInit();
    // debounce(email, validations, time: Duration(milliseconds: 500));
    // debounce(password, validations, time: Duration(milliseconds: 500));
  }

  void validations() async {
    errorTextEmail.value = null;
    errorTextPassword.value = null; // reset validation errors to nothing
    // reset validation errors to nothing
    submitFunc.value = null; // disable submit while validating
    if (email.value.isNotEmpty && password.value.isNotEmpty) {
      print("in");
      if (isValidEmail(email.value) && isvalidPassword(password.value)) {
        print("worked");
        print('All validations passed, enable submit btn...');
        submitFunction();
        errorTextEmail.value = null;
        errorTextPassword.value = null;
      }
    } else if (email.value.isEmpty && password.value.isEmpty) {
      errorTextEmail.value = "This field should not be empty";
      errorTextPassword.value = "This field should not be empty";
    } else if (email.value.isEmpty) {
      errorTextEmail.value = "This field should not be empty";
    } else if (password.value.isEmpty) {
      errorTextPassword.value = "This field should not be empty";
    }
  }

  bool isValidEmail(String val) {
    if (GetUtils.isEmail(val)) {
      return true;
    } else {
      errorTextEmail.value = "Not a valid email";
      return false;
    }
  }

  void usernameChanged(String val) {
    email.value = val;
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  void submitFunction() async {
    AuthController controller = Get.find();
    controller.signIn(email.value, password.value);
  }

  bool isvalidPassword(String value) {
    if (value.length >= 6) {
      return true;
    } else {
      errorTextPassword.value = "password is too short";
      return false;
    }
  }
}
