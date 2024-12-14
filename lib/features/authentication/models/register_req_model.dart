class RegisterReqModel {
  final String userName;
  final String password;
  final String email;
  final String phone;
  RegisterReqModel(
      {required this.userName,
      required this.password,
      required this.email,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      "username": userName,
      "password": password,
      "email": email,
      "phone": phone
    };
  }
}
