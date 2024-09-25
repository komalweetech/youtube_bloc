part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

    // email event.
class EmailChange extends LoginEvent {
  final String email;

  const EmailChange({required this.email});

  @override
// TODO: implement props
  List<Object?> get props => [email];
}

class EmailUnfocused extends LoginEvent{}

// password event
class PasswordChange extends LoginEvent {
  final String password;

  const PasswordChange({required this.password});
  @override
// TODO: implement props
  List<Object?> get props => [password];
}

class PasswordUnfocused extends LoginEvent{}


// login button

class LoginButton extends  LoginEvent {}