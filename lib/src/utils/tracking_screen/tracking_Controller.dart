import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:traking_screen/src/utils/device_info/device_info_controller.dart';
import 'package:traking_screen/src/utils/network/allRequests.dart';
import 'package:traking_screen/src/utils/tracking_screen/TrackingButtonModel.dart';
import 'package:traking_screen/src/utils/tracking_screen/trackingModel.dart';
import 'package:uuid/uuid.dart';

class Tracking_Controller extends GetxController {
  final ListTrackingScreen = List<TrackingModel>.empty(growable: true);
  final ListTrackingBtn = List<TrackingButtonModel>.empty(growable: true);

  Timer? timer;
  GetStorage AsyncStorage = GetStorage();

  var uuid = Uuid();
  final device_info_controller = Get.put(DeviceDataController());

  void sendTrackingToServer() async {
    bool isExist = AsyncStorage.hasData('Tracking_screen');

    if (isExist) {
      List<dynamic> trackingListDynamic =
          jsonDecode(AsyncStorage.read('Tracking_screen'));

      // ListTrackingBtn
      print('send data');
      // TODO setUp reguest to server

      // await sendDataReguestGet();
      // await sendDataReguestPost();
      // log(jsonEncode(ListTrackingScreen));
    } else {
      print('not save in controller');
    }
  }

  deleteTrackData() {
    ListTrackingScreen.removeWhere((element) => element.timeToExit != 'null');
    AsyncStorage.remove('Tracking_screen');
  }
  // TODO uncomment one of these

  // sendDataReguestGet() async {
  //   final request =
  //       await getHttp('api/trackingData${jsonEncode(ListTrackingScreen)}');
  //   final decodedResponse = jsonDecode(request.body);
  //   // lodaing.value = false;
  //   if (decodedResponse['success']) {
  // deleteTrackData()
  // }
  // }

  // sendDataReguestPost() async {
  //   final url = "api/trackingData";
  //   final body = jsonEncode(ListTrackingScreen);
  //   final reguest = await postHttp(url, body);
  //   final decodedResponse = jsonDecode(reguest.body);

  //   if (decodedResponse["success"]) {
  // deleteTrackData()
  // }
  // }

  onInitTrack() async {
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
        await device_info_controller.initPlatformState();
        if (device_info_controller.deviceData.isNotEmpty) {
          profile_id =
              device_info_controller.deviceData['DEVICE_ID'].toString();
          device_os = device_info_controller.deviceData['DEVICE_OS'].toString();
        } else {
          profile_id = uuid.v4();
          device_os = 'undefined';
        }
      }
    }

    DateTime dt = DateTime.now();

    Jalali shamsi_dt = dt.toJalali();

    String time_To_enter =
        '${shamsi_dt.year}-${shamsi_dt.month}-${shamsi_dt.day} ${shamsi_dt.hour}:${shamsi_dt.minute}:${shamsi_dt.second}';

    ListTrackingScreen.add(TrackingModel(
      profile_id: profile_id,
      device_os: device_os,
      pageInfo: '{}',
      navigationBar: 'screen', //TODO change navigationBar
      namePage: 'home', //TODO change root name
      timeToEnter: time_To_enter,
      timeToEnter_DateTime: dt.toString(),
      timeToExit: 'null',
      timeAveraged: 'null',
    ));
  }

  @override
  void onInit() {
    // TODO change time
    super.onInit();
    AsyncStorage.remove('Tracking_screen');
    onInitTrack();
    timer = Timer.periodic(
        Duration(seconds: 5), (Timer t) => sendTrackingToServer());
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
