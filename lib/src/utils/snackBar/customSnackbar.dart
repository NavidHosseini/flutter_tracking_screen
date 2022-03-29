import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(String title, {time = 2}) {
  Get.snackbar(
    "",
    "",
    // icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black54,
    borderRadius: 0,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    titleText: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )),
    colorText: Colors.white,
    duration: Duration(seconds: time),
    // animationDuration: Duration(microseconds: 1000),
    isDismissible: true,
    // dismissDirection: SnackDismissDirection.HORIZONTAL,

    // forwardAnimationCurve: Curves.easeOutBack,
  );
}

scafoldSnackBar(String title, context) {
  final snackBar = SnackBar(
    content: Text(
      title,
      style: TextStyle(fontFamily: 'Sans'),
    ),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
