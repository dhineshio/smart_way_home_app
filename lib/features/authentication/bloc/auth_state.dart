part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final String response;
  RegisterSuccessState({required this.response});
}

class RegisterFailureState extends AuthState {
  final String error;
  RegisterFailureState({required this.error});
}

class LoginSuccessState extends AuthState {
  final String response;
  LoginSuccessState({required this.response});
}

class LoginFailureState extends AuthState {
  final String error;
  LoginFailureState({required this.error});
}

class SendOtpSuccessState extends AuthState {
  final String response;
  SendOtpSuccessState({required this.response});
}

class SendOtpFailureState extends AuthState {
  final String error;
  SendOtpFailureState({required this.error});
}

class VerifyOtpSuccess extends AuthState {
  final String response;
  VerifyOtpSuccess({required this.response});
}

class VerifyOtpFailure extends AuthState {
  final String error;
  VerifyOtpFailure({required this.error});
}
