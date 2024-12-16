class ControlDeviceReqModel {
  final String deviceName;
  final String esp32Ip;
  final bool status;

  ControlDeviceReqModel(
      {required this.deviceName, required this.esp32Ip, required this.status});
  Map<String, dynamic> toMap() {
    return {"device": deviceName, "status": status};
  }
}
