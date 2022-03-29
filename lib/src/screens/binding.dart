import 'package:get/get.dart';
import 'package:traking_screen/src/utils/device_info/device_info_controller.dart';
import 'package:traking_screen/src/utils/tracking_screen/tracking_Controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Tracking_Controller>(Tracking_Controller());
    Get.put<DeviceDataController>(DeviceDataController());
  }
}
