import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class customLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: const Center(
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 30.0,
        ),
      ),
    );
  }
}
