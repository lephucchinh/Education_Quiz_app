part of 'register_screen_bloc.dart';

abstract class RegisterScreenEvent extends Equatable {
  const RegisterScreenEvent();
}

class RegisterAccountEvent extends RegisterScreenEvent {
  final String username;
  final String password;
  final String name;
  const RegisterAccountEvent( {required this.name,required this.username, required this.password});
  @override
  List<Object?> get props => [username,password,name];
}

class RegisterServicesEvent extends RegisterScreenEvent {
  @override
  List<Object?> get props => [];

}
