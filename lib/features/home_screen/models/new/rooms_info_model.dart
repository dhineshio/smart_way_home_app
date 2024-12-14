class RoomsInfoModel {
  final int roomId;
  final int iconId;
  final String roomName;
  bool? isActive;

  RoomsInfoModel(
      {required this.roomId,
      required this.iconId,
      required this.roomName,
      this.isActive = false});
}
