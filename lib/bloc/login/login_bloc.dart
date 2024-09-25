import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:youyube_bloc/repository/auth/login_repository.dart';
import 'package:youyube_bloc/services/session_manager/session_controller.dart';
import 'package:youyube_bloc/utils/enums.dart';

part 'login_event.dart';
part '../login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository ;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<LoginButton>(_onLoginButton);
  }

  void _onEmailChange(EmailChange event, Emitter<LoginState> emit) {
    print("email : ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginButton(LoginButton event, Emitter<LoginState> emit) async {
    Map data = {"email": state.email, "password": state.password};
    // Map data = { "email": "eve.holt@reqres.in", "password": "cityslicka"};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            apiMessage: value.error.toString(),
            postApiStatus: PostApiStatus.error));

      } else {
        // to save user data
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
           emit(state.copyWith(
            apiMessage: "login successfull",
            postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          apiMessage: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
