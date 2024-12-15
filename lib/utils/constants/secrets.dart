class Secrets {
  Secrets._();
  static const String baseUrl = "https://45e3-14-195-129-246.ngrok-free.app";
  static const String registerEndPoint = "$baseUrl/api/auth/register";
  static const String loginEndPoint = "$baseUrl/api/auth/login";
  static const String sendOtpEndPoint = "$baseUrl/api/v1/otp/send";
  static const String verifyOtpEndPoint = "$baseUrl/api/v1/otp/validate";
  static const String addRooms = "$baseUrl/rooms";
  static const String getRooms = "$baseUrl/rooms";
  static const String baseUrlNew =
      "https://3c10-2401-4900-1cd4-a246-ac86-802a-b366-53be.ngrok-free.app";
  static const String addRoomsNew = "$baseUrlNew/api/rooms";
}
