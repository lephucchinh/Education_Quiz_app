part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignUpFailure extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignUpProgress extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
