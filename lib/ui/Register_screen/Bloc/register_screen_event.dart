part of 'register_screen_bloc.dart';

abstract class RegisterScreenEvent extends Equatable {
  const RegisterScreenEvent();
}

class RegisterAccountEvent extends RegisterScreenEvent {
  final String username;
  final String password;

  const RegisterAccountEvent({required this.username, required this.password});
  @override
  List<Object?> get props => [username,password];
}

class RegisterServicesEvent extends RegisterScreenEvent {
  @override
  List<Object?> get props => [];

}
