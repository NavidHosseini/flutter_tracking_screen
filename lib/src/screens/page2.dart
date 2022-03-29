import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backToPreviousScreen(is_back_to_root: true);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(''.tr),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            // automaticallyImplyLeading: false,
            // leading: GestureDetector(
            //\t onTap: () {
            //\t   Get.back();
            //\t },
            //\t child: Container(
            //\t\t padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //\t\t //color: Colors.black,
            //\t\t child: Icon(EvilIcons.chevron_right, size: 40))),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
