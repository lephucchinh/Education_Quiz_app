part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInRequired extends SignInEvent {
  final String email;
  final String password;

  const SignInRequired({required this.email, required this.password});

  @override
  List<Object?> get props => [email,password];

}

class SignOutRequired extends SignInEvent {
  final String myUserId;

  const SignOutRequired({required this.myUserId});

  @override
  List<Object?> get props => [myUserId];
}

