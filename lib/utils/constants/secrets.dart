class Secrets {
  Secrets._();
  static const String baseUrl = "https://jzrd8wf4-8080.inc1.devtunnels.ms";
  static const String registerEndPoint = "$baseUrl/api/auth/register";
  static const String loginEndPoint = "$baseUrl/api/auth/login";
  static const String sendOtpEndPoint = "$baseUrl/api/v1/otp/send";
  static const String verifyOtpEndPoint = "$baseUrl/api/v1/otp/validate";
  static const String addRooms = "$baseUrl/rooms";
  static const String getRooms = "$baseUrl/rooms";
  static const String baseUrlNew = "https://jzrd8wf4-8080.inc1.devtunnels.ms";
  static const String addRoomsNew = "$baseUrlNew/api/rooms";
}
