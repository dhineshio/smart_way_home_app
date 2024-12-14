import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_way_home/features/authentication/models/login_req_model.dart';
import 'package:smart_way_home/features/authentication/models/register_req_model.dart';
import 'package:smart_way_home/features/authentication/models/verify_otp_model.dart';
import 'package:smart_way_home/features/authentication/usecase/login_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/register_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/send_otp_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/verify_otp_use_case.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RequestRegisterEvent>((state, emit) async {
      emit(AuthLoadingState());
      try {
        final userName = state.userName;
        final password = state.password;
        final email = state.email;
        final phone = state.phone;

        final result = await getIt<RegisterUseCase>().call(
          RegisterReqModel(
              userName: userName,
              password: password,
              email: email,
              phone: phone),
        );

        return result.fold(
            (failure) =>
                emit(RegisterFailureState(error: (result as Left).value)),
            (success) =>
                emit(RegisterSuccessState(response: (result as Right).value)));
      } catch (e) {
        return emit(RegisterFailureState(error: e.toString()));
      }
    });

    on<SendOtpEvent>((state, emit) async {
      emit(AuthLoadingState());
      try {
        final email = state.email;
        final response = await getIt<SendOtpUseCase>().call(email);
        return response.fold(
          (failure) =>
              emit(SendOtpFailureState(error: (response as Left).value)),
          (success) =>
              emit(SendOtpSuccessState(response: (response as Right).value)),
        );
      } catch (e) {
        return emit(SendOtpFailureState(error: e.toString()));
      }
    });

    on<RequestLoginEvent>((state, emit) async {
      emit(AuthLoadingState());
      try {
        emit(AuthLoadingState());
        final email = state.email;
        final password = state.password;

        var response = await getIt<LoginUseCase>()
            .call(LoginReqModel(email: email, password: password));

        return response.fold(
          (failure) => emit(LoginFailureState(error: (response as Left).value)),
          (success) {
            String token = (response as Right).value;
            getIt<GetStorage>().write("access-token", token);
            return emit(LoginSuccessState(response: "Login Success..."));
          },
        );
      } catch (e) {
        return emit(LoginFailureState(error: e.toString()));
      }
    });

    on<VerifyOtpEvent>((state, emit) async {
      emit(AuthLoadingState());
      try {
        final email = state.email;
        final otp = state.otp;

        final response = await getIt<VerifyOtpUseCase>()
            .call(VerifyOtpModel(email: email, otp: otp));
        return response.fold(
          (failure) => emit(VerifyOtpFailure(error: (response as Left).value)),
          (success) =>
              emit(VerifyOtpSuccess(response: (response as Right).value)),
        );
      } catch (e) {
        return emit(VerifyOtpFailure(error: e.toString()));
      }
    });
  }
}
