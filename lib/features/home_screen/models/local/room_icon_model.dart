class RoomIconModel {
  final int id;
  final String title;
  final String icon;
  bool? isSelected;
  RoomIconModel({
    required this.id,
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}
