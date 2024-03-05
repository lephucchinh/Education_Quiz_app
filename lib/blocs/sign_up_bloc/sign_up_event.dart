part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpRequired extends SignUpEvent {

  final MyUser user;
  final String password;

  const SignUpRequired({required this.user, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [user,password];

}
