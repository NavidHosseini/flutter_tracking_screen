import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking.dart';

class Page33 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backToPreviousScreen(is_back_to_root: false);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(''.tr),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(),
        ),
      ),
    );
  }
}
