class DeviceData {
  final int deviceId;
  final String deviceName;
  final String homeCategory;
  bool isActive;

  DeviceData(
      {required this.deviceId,
      required this.deviceName,
      required this.homeCategory,
      required this.isActive});
}
