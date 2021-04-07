import 'package:assembly/controllers/auth_controller.dart';
import 'package:assembly/controllers/form_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  final TextEditingController shippingAddress1 = TextEditingController();
  final TextEditingController shippingAddress2 = TextEditingController();
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    FormX fx = Get.put(FormX()); // controller
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.change(),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: AutofillGroup(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () {
                    return TextFormField(
                        controller: shippingAddress1,
                        autofillHints: [
                          AutofillHints.username,
                        ],
                        onEditingComplete: () =>
                            TextInput.finishAutofillContext(),
                        onChanged: fx.usernameChanged,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'email',
                            errorText: fx.errorTextEmail.value // obs
                            ));
                  },
                ),
                ValueBuilder<bool>(
                    initialValue: true,
                    builder: (value, updateFn) => Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () {
                                  return TextFormField(
                                      controller: shippingAddress2,
                                      autofillHints: [AutofillHints.password],
                                      obscureText: value,
                                      textInputAction: TextInputAction.next,
                                      obscuringCharacter: "*",
                                      onChanged:
                                          fx.passwordChanged, // controller func
                                      onEditingComplete: () =>
                                          TextInput.finishAutofillContext(),
                                      decoration: InputDecoration(
                                          suffixIcon: Switch(
                                            value: value,
                                            onChanged:
                                                updateFn, // same signature! you could use ( newValue ) => updateFn( newValue )
                                          ),
                                          labelText: 'password',
                                          errorText:
                                              fx.errorTextPassword.value // obs
                                          ));
                                },
                              ),
                            ),
                          ],
                        )),
                TextButton(child: Text('Submit'), onPressed: fx.validations),
                // obs
              ],
            ),
          ),
        ),
      ),
    );
  }
}
