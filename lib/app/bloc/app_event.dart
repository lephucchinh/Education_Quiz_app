part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
}

class LoginEvent extends AppEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username,password];

}