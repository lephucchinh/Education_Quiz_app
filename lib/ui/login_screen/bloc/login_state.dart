part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class SuccessLoginState extends LoginState {
  final String username;

  const SuccessLoginState({required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];

}

class RegisteringServicesState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
