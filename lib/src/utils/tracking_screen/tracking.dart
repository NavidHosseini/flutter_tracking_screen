import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:traking_screen/src/utils/device_info/device_info_controller.dart';
import 'package:traking_screen/src/utils/tracking_screen/TrackingButtonModel.dart';
import 'package:traking_screen/src/utils/tracking_screen/trackingModel.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking_Controller.dart';
import 'package:uuid/uuid.dart';

GetStorage AsyncStorage = GetStorage();

var uuid = Uuid();
final tracking_controller = Get.find<Tracking_Controller>();
final device_info_controller = Get.find<DeviceDataController>();

void goToScreenOrTab({
  required String pageNameOrTabName,
  required bool isForTabBar,
  dynamic arguments,
  dynamic trackingInfo,
}) {
  late String profile_id;
  late String device_os;

  if (AsyncStorage.hasData('profile')) {
    // TODO remember setUp profile id
    profile_id = AsyncStorage.read('profile')['id'].toString();
  } else {
    if (device_info_controller.deviceData.isNotEmpty) {
      profile_id = device_info_controller.deviceData['DEVICE_ID'].toString();
      device_os = device_info_controller.deviceData['DEVICE_OS'].toString();
    } else {
      profile_id = uuid.v4();
      device_os = 'undefined';
    }
  }
  DateTime dt = DateTime.now();

  Jalali shamsi_dt = dt.toJalali();

  String time_To_enter =
      '${shamsi_dt.year}-${shamsi_dt.month}-${shamsi_dt.day} ${shamsi_dt.hour}:${shamsi_dt.minute}:${shamsi_dt.second}';

  var isAnyScreenNotEnd = tracking_controller.ListTrackingScreen.where(
      (screenTrack) => screenTrack.timeToExit == 'null').toList();

  if (isAnyScreenNotEnd.length > 0) {
    var Index_isAnyScreenNotEnd =
        tracking_controller.ListTrackingScreen.indexWhere(
            (screenTrack) => screenTrack.timeToExit == 'null');

    var a = isAnyScreenNotEnd[0];

    TrackingModel newTrack = TrackingModel(
      namePage: a.namePage,
      profile_id: a.profile_id,
      device_os: a.device_os,
      pageInfo: a.pageInfo,
      timeToEnter: a.timeToEnter,
      timeToEnter_DateTime: a.timeToEnter_DateTime,
      timeToExit: time_To_enter,
      navigationBar: a.navigationBar,
      timeAveraged:
          dt.difference(DateTime.parse(a.timeToEnter_DateTime)).toString(),
    );

    tracking_controller.ListTrackingScreen[Index_isAnyScreenNotEnd] = newTrack;
  }

  tracking_controller.ListTrackingScreen.add(TrackingModel(
    namePage: pageNameOrTabName,
    profile_id: profile_id,
    device_os: device_os,
    pageInfo: trackingInfo != null ? jsonEncode(trackingInfo) : '{}',
    timeToEnter: time_To_enter,
    timeToEnter_DateTime: dt.toString(),
    navigationBar: isForTabBar ? 'tabBar' : 'screen',
    timeToExit: 'null',
    timeAveraged: 'null',
  ));
  if (isForTabBar == false) {
    Get.toNamed(pageNameOrTabName, arguments: arguments);
  }
}

void backToPreviousScreen({required is_back_to_root}) {
  String page_Name;
  String navBarName;

  if (is_back_to_root) {
    page_Name = 'home';
    navBarName = 'screen';
    // TODO CHANGE NAVBARNAME
  } else {
    if (tracking_controller.ListTrackingScreen.length > 0) {
      TrackingModel lastItem = tracking_controller.ListTrackingScreen[
          tracking_controller.ListTrackingScreen.length - 2];

      if (lastItem.navigationBar == 'tabBar') {
        navBarName = 'tabBar';
        page_Name = lastItem.namePage;
      } else {
        navBarName = 'screen';
        if (Get.previousRoute.contains('/')) {
          page_Name = Get.previousRoute.split('/')[1];
        } else {
          page_Name = Get.previousRoute;
        }
        log('message $page_Name');
      }
    } else {
      navBarName = 'screen';
      if (Get.previousRoute.contains('/')) {
        page_Name = Get.previousRoute.split('/')[1];
      } else {
        page_Name = Get.previousRoute;
      }
      log('message $page_Name');
    }
  }

  late String profile_id;
  late String device_os;

  if (AsyncStorage.hasData('profile')) {
    // TODO remember setUp profile id
    profile_id = AsyncStorage.read('profile')['id'].toString();
  } else {
    if (device_info_controller.deviceData.isNotEmpty) {
      profile_id = device_info_controller.deviceData['DEVICE_ID'].toString();
      device_os = device_info_controller.deviceData['DEVICE_OS'].toString();
    } else {
      profile_id = uuid.v4();
      device_os = 'undefined';
    }
  }

  DateTime dt = DateTime.now();
  Jalali shamsi_dt = dt.toJalali();

  String time_To_exit =
      '${shamsi_dt.year}-${shamsi_dt.month}-${shamsi_dt.day} ${shamsi_dt.hour}:${shamsi_dt.minute}:${shamsi_dt.second}';

  var screensToTrack = tracking_controller.ListTrackingScreen.where(
      (a) => a.timeToExit == 'null').toList();
  if (screensToTrack.length > 0) {
    var a = screensToTrack[0];
    var Index_screensToTrack =
        tracking_controller.ListTrackingScreen.indexWhere(
            (screenTrack) => screenTrack.timeToExit == 'null');

    TrackingModel screenToTrackUpdate = TrackingModel(
      namePage: a.namePage,
      profile_id: a.profile_id,
      device_os: a.device_os,
      pageInfo: a.pageInfo,
      navigationBar: a.navigationBar,
      timeToEnter: a.timeToEnter,
      timeToEnter_DateTime: a.timeToEnter_DateTime,
      timeToExit: time_To_exit,
      timeAveraged:
          dt.difference(DateTime.parse(a.timeToEnter_DateTime)).toString(),
    );

    tracking_controller.ListTrackingScreen[Index_screensToTrack] =
        screenToTrackUpdate;

    tracking_controller.ListTrackingScreen.add(TrackingModel(
      namePage: page_Name,
      profile_id: profile_id,
      device_os: device_os,
      pageInfo: '{}',
      navigationBar: navBarName,
      timeToEnter: time_To_exit,
      timeToEnter_DateTime: dt.toString(),
      timeToExit: 'null',
      timeAveraged: 'null',
    ));

    AsyncStorage.write(
        'Tracking_screen', jsonEncode(tracking_controller.ListTrackingScreen));
    // log(jsonEncode(tracking_controller.ListTrackingScreen));
    Get.back();
  } else {
    print('else');
    // Get.back();
  }
}

class TGestureDetector extends StatelessWidget {
  final Widget child;
  final String btnName;
  final String details;
  final void Function() onTap;

  const TGestureDetector({
    Key? key,
    required this.child,
    required this.onTap,
    required this.btnName,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void trackButton() {
      DateTime dt = DateTime.now();
      Jalali shamsi_dt = dt.toJalali();

      String time_To_pressed =
          '${shamsi_dt.year}-${shamsi_dt.month}-${shamsi_dt.day} ${shamsi_dt.hour}:${shamsi_dt.minute}:${shamsi_dt.second}';

      tracking_controller.ListTrackingBtn.add(
        TrackingButtonModel(
          btnName: btnName,
          details: details,
          timePressed: time_To_pressed,
          timePressed_DateTime: dt.toString(),
        ),
      );

      onTap();
    }

    return GestureDetector(
      child: child,
      onTap: trackButton,
    );
  }
}
