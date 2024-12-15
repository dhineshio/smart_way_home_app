import 'package:flutter/material.dart';

class DeviceIconModel {
  final int deviceId;
  final String deviceName;
  final String deviceType;
  final String iconId;
  bool? isClicked;
  DeviceIconModel(
      {required this.deviceId,
      required this.deviceName,
      required this.deviceType,
      required this.iconId,
      this.isClicked = false});
}
