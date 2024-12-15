class AddDeviceReqModel {
  final int roomId;
  final String name;
  final String type;
  AddDeviceReqModel({
    required this.roomId,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {"name": name, "type": type, "status": false};
  }
}
