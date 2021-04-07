import 'package:assembly/uitls/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.changeTheme(
              !(Get.theme.brightness == ThemeData.dark().brightness)
                  ? ThemeData.dark().copyWith(accentColor: Colors.yellow)
                  : ThemeData.light().copyWith(accentColor: Colors.brown))),
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
              elevation: 0.0,
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
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Center(
                  child: Container(
                width: 100,
                height: 100,
                color: Get.theme.accentColor,
              )),
              Center(
                  child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              )),
              Center(
                  child: Container(
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
          Row(
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
                                elevation: 10.0,
                                extended: val,
                                onDestinationSelected: (value) {
                                  controller.page = value;
                                  pageController.jumpToPage(value);
                                },
                                destinations: dashboardItemsList
                                    .map((e) => NavigationRailDestination(
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
            ],
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
}
