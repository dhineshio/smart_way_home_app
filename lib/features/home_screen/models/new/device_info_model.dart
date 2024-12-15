class DeviceInfoModel {
  final int roomId;
  final int deviceId;
  final String deviceIcon;
  final String deviceName;
  final String deviceType;
  bool? isActive;
  DeviceInfoModel(
      {required this.roomId,
      required this.deviceId,
      required this.deviceIcon,
      required this.deviceName,
      required this.deviceType,
      this.isActive});
}
