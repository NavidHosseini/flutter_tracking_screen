class TrackingButtonModel {
  late String btnName;
  late String details;
  late String timePressed;
  late String timePressed_DateTime;

  TrackingButtonModel({
    required this.btnName,
    required this.details,
    required this.timePressed,
    required this.timePressed_DateTime,
  });

  TrackingButtonModel.fromJson(Map<String, dynamic> json) {
    btnName = json['btnName'];
    details = json['details'];
    timePressed = json['timePressed'];
    timePressed_DateTime = json['timePressed_DateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['btnName'] = btnName;
    data['details'] = details;
    data['timePressed'] = timePressed;
    data['timePressed_DateTime'] = timePressed_DateTime;

    return data;
  }
}
