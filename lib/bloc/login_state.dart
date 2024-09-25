part of 'login/login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String apiMessage;
  final PostApiStatus postApiStatus;

  const LoginState({
      this.email = '',
      this.password = '',
      this.apiMessage = '',
      this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith({
    String? email,
    String? password,
    String? apiMessage,
    PostApiStatus? postApiStatus,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        apiMessage:  apiMessage ?? this.apiMessage,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, apiMessage,postApiStatus];
}
