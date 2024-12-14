class LoginReqModel {
  final String email;
  final String password;
  LoginReqModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }
}
