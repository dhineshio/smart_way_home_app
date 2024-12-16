class DeviceInfoModel {
  final int roomId;
  final int deviceId;
  final String deviceIcon;
  final String deviceName;
  final String deviceType;
  final String roomEsp32Ip;
  bool? isActive;
  DeviceInfoModel({
    required this.roomId,
    required this.deviceId,
    required this.deviceIcon,
    required this.deviceName,
    required this.deviceType,
    required this.roomEsp32Ip,
    this.isActive,
  });
}
