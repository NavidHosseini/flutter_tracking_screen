import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking.dart';
import 'package:traking_screen/src/utils/tracking_screen/trackingModel.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage AsyncStorage = GetStorage();

    void printTrackList() {
      bool isExist = AsyncStorage.hasData('Tracking_screen');
      final ListTrackingScreen = List<TrackingModel>.empty(growable: true);

      if (isExist) {
        List<dynamic> trackingListDynamic =
            jsonDecode(AsyncStorage.read('Tracking_screen'));
        trackingListDynamic.forEach((element) {
          var trackScreen = TrackingModel(
            profile_id: element['profile_id'],
            device_os: element['device_os'],
            namePage: element['namePage'],
            pageInfo: element['pageInfo'],
            navigationBar: element['navigationBar'],
            timeToEnter: element['timeToEnter'],
            timeToEnter_DateTime: element['timeToEnter_DateTime'],
            timeToExit: element['timeToExit'],
            timeAveraged: element['timeAveraged'],
          );
          ListTrackingScreen.add(trackScreen);
        });
        // print(ListTrackingScreen[0].namePage);
        log(jsonEncode(ListTrackingScreen));
      } else {
        print('not save');
      }
    }

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
          ),
          body: Column(
            children: [
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        goToScreenOrTab(
                            pageNameOrTabName: 'Page11', isForTabBar: false);
                      },
                      child: Text('page 11'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        printTrackList();
                      },
                      child: Text('track list'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        goToScreenOrTab(
                            pageNameOrTabName: 'Page12', isForTabBar: false);
                      },
                      child: Text('page 12'))),
            ],
          ),
        ),
      ),
    );
  }
}
