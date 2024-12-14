class AddRoomsModel {
  final String iconId;
  final String token;
  AddRoomsModel({required this.iconId, required this.token});

  Map<String, dynamic> toMap() {
    return {"iconId": iconId};
  }

  Map<String, dynamic> sendToken() {
    return {"Authorization": token};
  }
}
