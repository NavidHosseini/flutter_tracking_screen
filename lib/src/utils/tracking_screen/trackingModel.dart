class TrackingModel {
  late String namePage;
  late String profile_id;
  late String device_os;
  late String pageInfo;
  late String timeToEnter;
  late String timeToEnter_DateTime;
  late String timeToExit;
  late String timeAveraged;
  late String navigationBar;

  TrackingModel({
    required this.namePage,
    required this.profile_id,
    required this.device_os,
    required this.pageInfo,
    required this.timeToEnter,
    required this.timeToEnter_DateTime,
    required this.timeToExit,
    required this.timeAveraged,
    required this.navigationBar,
  });

  TrackingModel.fromJson(Map<String, dynamic> json) {
    namePage = json['namePage'];
    profile_id = json['profile_id'];
    device_os = json['device_os'];
    pageInfo = json['pageInfo'];
    timeToEnter = json['timeToEnter'];
    timeToEnter_DateTime = json['timeToEnter_DateTime'];
    timeToExit = json['timeToExit'];
    timeAveraged = json['timeAveraged'];
    navigationBar = json['navigationBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['namePage'] = namePage;
    data['profile_id'] = profile_id;
    data['device_os'] = device_os;
    data['pageInfo'] = pageInfo;
    data['timeToEnter'] = timeToEnter;
    data['timeToEnter_DateTime'] = timeToEnter_DateTime;
    data['timeToExit'] = timeToExit;
    data['timeAveraged'] = timeAveraged;
    data['navigationBar'] = navigationBar;

    return data;
  }
}
