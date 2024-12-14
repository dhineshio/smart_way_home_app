class AddRoomNewModel {
  final String name;
  final String esp32Ip;
  final List<Map<String, dynamic>>? devices = [];
  AddRoomNewModel({required this.name, required this.esp32Ip});

  Map<String, dynamic> toMap() {
    return {"name": name, "esp32Ip": esp32Ip, "devices": devices};
  }
}
