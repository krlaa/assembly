import 'package:assembly/controllers/auth_controller.dart';
import 'package:assembly/screens/admin_home_screen.dart';
import 'package:assembly/uitls/colors.dart';
import 'package:assembly/uitls/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:assembly/main.dart';
import 'package:tinycolor/tinycolor.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(keepPage: false, initialPage: controller.page);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "1",
              onPressed: () {
                Get.changeTheme(lightTheme);
              }),
          FloatingActionButton(
              heroTag: "2",
              onPressed: () {
                // Get.changeTheme(
                //     Get.theme.copyWith(backgroundColor: Colors.red));
                Get.changeTheme(darkTheme);
              }),
        ],
      ),
      drawerScrimColor: Colors.transparent,
      appBar: context.showNavbar
          ? null
          : AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer: context.showNavbar
          ? null
          : Drawer(
              elevation: 10.0,
              child: ListView.builder(
                itemCount: dashboardItemsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dashboardItemsList[index].label),
                    leading: controller.page == index
                        ? Icon(
                            dashboardItemsList[index].icon.icon,
                            color: Colors.blue,
                          )
                        : Icon(
                            dashboardItemsList[index].icon.icon,
                            color: Colors.black,
                          ),
                    onTap: () {
                      controller.page = index;
                      pageController.jumpToPage(index);
                      Get.back();
                    },
                  );
                },
              ),
            ),
      body: Row(
        children: [
          context.showNavbar
              ? ValueBuilder<bool>(
                  initialValue: false,
                  builder: (val, updater) {
                    return MouseRegion(
                      cursor: MouseCursor.defer,
                      onEnter: (event) {
                        updater(!val);
                      },
                      onExit: (event) {
                        updater(!val);
                      },
                      child: Obx(
                        () => NavigationRail(
                            backgroundColor: Get.theme.cardColor,
                            unselectedLabelTextStyle:
                                TextStyle(color: Get.theme.iconTheme.color),
                            unselectedIconTheme:
                                IconThemeData(color: Get.theme.iconTheme.color),
                            selectedLabelTextStyle:
                                TextStyle(color: Get.theme.primaryColor),
                            selectedIconTheme:
                                IconThemeData(color: Get.theme.primaryColor),
                            elevation: 10,
                            extended: val,
                            onDestinationSelected: (value) {
                              controller.page = value;
                              pageController.animateToPage(value,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInSine);
                            },
                            destinations: dashboardItemsList
                                .map((e) => NavigationRailDestination(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    icon: e.icon,
                                    selectedIcon: Icon(e.icon.icon),
                                    label: Text(e.label)))
                                .toList(),
                            selectedIndex: controller.page),
                      ),
                    );
                  },
                )
              : Container(),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AdminHomePage(),
                Center(
                    child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 100,
                  height: 100,
                  color: context.theme.brightness == Brightness.dark
                      ? Color(0xFF4B4B4B)
                      : Color(0xFFD8D8D8),
                )),
                Center(
                    child: Container(
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.to(Nav());
                    },
                  ),
                  width: 100,
                  height: 100,
                  color: Colors.black,
                )),
                Center(
                    child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _page = 0.obs;
  set page(value) => this._page.value = value;
  get page => this._page.value;
  @override
  void dispose() {
    print("I dispose");
    page = 0;
    super.dispose();
  }
}

// class ThemeController extends GetxController {
//   final _theme = ThemeData.light().copyWith(accentColor: Colors.red).obs;
//   get theme => _theme.value;
//   set theme(value) => this._theme.value = value;
// }
