class RoomsInfoModel {
  final int roomId;
  final int iconId;
  final String roomName;
  final String esp32Id;
  bool? isActive;

  RoomsInfoModel(
      {required this.roomId,
      required this.iconId,
      required this.roomName,
      required this.esp32Id,
      this.isActive = false});
}
