import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page3Controller = Get.put(Page3Controller());

    return WillPopScope(
      onWillPop: () async {
        backToPreviousScreen(is_back_to_root: true);
        return false;
      },
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              // bottom:

              title: TabBar(
                controller: page3Controller.tabcontroller,
                onTap: (int index) {
                  page3Controller.tabControllerIndex.jumpToPage(index);
                  goToScreenOrTab(
                    pageNameOrTabName: 'Tab $index',
                    isForTabBar: true,
                  );
                },
                tabs: const [
                  Tab(
                      icon: Icon(
                    Icons.flight,
                    color: Colors.black,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.directions_transit,
                    color: Colors.black,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.directions_car,
                    color: Colors.black,
                  )),
                ],
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              // centerTitle: true,
            ),
            body: PageView(
              onPageChanged: (i) {
                page3Controller.tabcontroller.animateTo(i);
                goToScreenOrTab(pageNameOrTabName: 'Tab $i', isForTabBar: true);
              },
              controller: page3Controller.tabControllerIndex,
              children: [
                const Icon(Icons.flight, size: 350),
                SizedBox(
                    width: Get.width * 0.8,
                    child: ElevatedButton(
                        onPressed: () {
                          goToScreenOrTab(
                              pageNameOrTabName: 'Page33', isForTabBar: false);
                        },
                        child: Text('page 33'))),
                const Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page3Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabcontroller;

  final PageController tabControllerIndex = PageController();

  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(vsync: this, length: 3, initialIndex: 0);
    goToScreenOrTab(pageNameOrTabName: 'Tab 0', isForTabBar: true);
  }

  @override
  void onClose() {
    super.onClose();
    tabcontroller.dispose();
  }
}
