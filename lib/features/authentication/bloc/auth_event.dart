part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RequestRegisterEvent extends AuthEvent {
  final String userName;
  final String password;
  final String email;
  final String phone;

  RequestRegisterEvent(
      {required this.userName,
      required this.password,
      required this.email,
      required this.phone});
}

class RequestLoginEvent extends AuthEvent {
  final String email;
  final String password;
  RequestLoginEvent({required this.email, required this.password});
}

class SendOtpEvent extends AuthEvent {
  final String email;
  SendOtpEvent({required this.email});
}

class VerifyOtpEvent extends AuthEvent {
  final String email;
  final String otp;
  VerifyOtpEvent({required this.email, required this.otp});
}
