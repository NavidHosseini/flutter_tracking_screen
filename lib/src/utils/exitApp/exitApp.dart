import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget exitApp2PressBack({child, required bool condition, Function? onBack}) {
  return condition
      ? containerWithCondition(onBack, child)
      : DoubleBack(
          message: "برای خارج شدن دوباره بازگشت را بزنید",
          child: child,
          condition: true,
          // textStyle: TextStyle(
          //   fontSize: 13,
          //   color: Colors.white,
          // ),
          // background: Colors.red,
          // backgroundRadius: 30,
        );
}

Widget containerWithCondition(Function? onBack, child) {
  Future<bool> _willPopScopeCall() async {
    onBack!();
    return false;
  }

  return WillPopScope(child: child, onWillPop: _willPopScopeCall);
}
