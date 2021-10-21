import 'package:assembly/controllers/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Get.theme.iconTheme.color),
      child: SafeArea(
          child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1 / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 78),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // color: Colors.red,
                      child: SelectableText(
                    'Class',
                    cursorColor: Get.theme.iconTheme.color,
                    cursorRadius: Radius.circular(100),
                    showCursor: false,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textScaleFactor: 2,
                  )),
                  SelectableText(
                    // NOTE: Interpolate actual grade
                    'First Grade',
                    cursorColor: Get.theme.iconTheme.color,
                    cursorRadius: Radius.circular(100),
                    showCursor: false,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
                    textScaleFactor: 2,
                  ),
                  Container(
                    // color: Colors.red,
                    child: Row(
                      children: [
                        SelectableText(
                          // NOTE: Interpolate actual grade
                          'Year',
                          cursorColor: Get.theme.iconTheme.color,
                          cursorRadius: Radius.circular(100),
                          showCursor: false,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                          textScaleFactor: 2,
                        ),
                        SelectableText(
                          // NOTE: Interpolate actual grade
                          'Students',
                          cursorColor: Get.theme.iconTheme.color,
                          cursorRadius: Radius.circular(100),
                          showCursor: false,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                          textScaleFactor: 2,
                        ),
                        SelectableText(
                          // NOTE: Interpolate actual grade
                          'Teacher',
                          cursorColor: Get.theme.iconTheme.color,
                          cursorRadius: Radius.circular(100),
                          showCursor: false,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                          textScaleFactor: 2,
                        ),
                        SelectableText.rich(TextSpan(
                          text: 'Year',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
