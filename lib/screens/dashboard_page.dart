import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: context.showNavbar
          ? null
          : Drawer(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      controller.page = index;
                      pageController.jumpToPage(index);
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
                            extended: val,
                            onDestinationSelected: (value) {
                              controller.page = value;
                              pageController.jumpToPage(value);
                            },
                            destinations: [
                              NavigationRailDestination(
                                icon: Icon(Icons.favorite_border),
                                selectedIcon: Icon(Icons.favorite),
                                label: Text('First'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.bookmark_border),
                                selectedIcon: Icon(Icons.book),
                                label: Text('Second'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.star_border),
                                selectedIcon: Icon(Icons.star),
                                label: Text('Third'),
                              ),
                            ],
                            selectedIndex: controller.page),
                      ),
                    );
                  },
                )
              : Container(),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Center(
                    child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
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
                ))
              ],
            ),
          )
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
