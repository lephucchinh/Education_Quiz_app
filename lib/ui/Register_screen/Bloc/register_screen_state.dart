part of 'register_screen_bloc.dart';

abstract class RegisterScreenState extends Equatable {
  const RegisterScreenState();
}

class RegisterScreenInitial extends RegisterScreenState {

  @override
  List<Object> get props => [];
}
class SuccessRegisterState extends RegisterScreenState {
  final String username;

  const SuccessRegisterState({required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];

}

class FailureRegisterState extends RegisterScreenState {
  final String error;

  const FailureRegisterState({required this.error});
  @override
  List<Object?> get props => [error];

}
