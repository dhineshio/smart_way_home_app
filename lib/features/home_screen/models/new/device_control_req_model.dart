class DeviceControlReqModel {
  final int roomId;
  final int deviceId;
  final bool status;

  DeviceControlReqModel(
      {required this.roomId, required this.deviceId, required this.status});

  Map<String, dynamic> toMap() {
    return {"status": status};
  }
}
