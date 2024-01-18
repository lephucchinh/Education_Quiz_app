part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPressEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginPressEvent({required this.username, required this.password});
  List<Object?> get props => [username, password];

}

class RegisterServicesEvent extends LoginEvent {

  @override
  List<Object?> get props => [];

}
