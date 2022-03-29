import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traking_screen/src/utils/device_info/device_info_controller.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking.dart';
import 'package:traking_screen/src/utils/tracking_screen/trackingModel.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking_Controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage AsyncStorage = GetStorage();
    final device_info_controller = Get.find<DeviceDataController>();
    final tracking_controller = Get.find<Tracking_Controller>();

    void printTrackList() {
      bool isExist = AsyncStorage.hasData('Tracking_screen');
      final ListTrackingScreen = List<TrackingModel>.empty(growable: true);

      if (isExist) {
        List<dynamic> trackingListDynamic =
            jsonDecode(AsyncStorage.read('Tracking_screen'));
        trackingListDynamic.forEach((element) {
          var trackScreen = TrackingModel(
            namePage: element['namePage'],
            profile_id: element['profile_id'],
            device_os: element['device_os'],
            navigationBar: element['navigationBar'],
            pageInfo: element['pageInfo'],
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

    void clearTrackList() {
      AsyncStorage.remove('Tracking_screen');
      tracking_controller.ListTrackingScreen.clear();
    }

    void deviceInfo() {
      log(jsonEncode(device_info_controller.deviceData['DEVICE_ID']));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('home'),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        goToScreenOrTab(
                            pageNameOrTabName: 'Page1', isForTabBar: false);
                      },
                      child: Text('page 1'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        goToScreenOrTab(
                            pageNameOrTabName: 'Page2', isForTabBar: false);
                      },
                      child: Text('page 2'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        goToScreenOrTab(
                            pageNameOrTabName: 'Page3', isForTabBar: false);
                      },
                      child: Text('page 3 tabbar'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: printTrackList, child: Text('trackList'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: clearTrackList,
                      child: Text('clear trackList'))),
              SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                      onPressed: deviceInfo, child: Text('device info'))),
            ],
          ),
        ),
      ),
    );
  }
}
