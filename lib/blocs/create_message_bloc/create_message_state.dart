part of 'create_message_bloc.dart';

sealed class CreateMessageState extends Equatable {
  const CreateMessageState();
}

final class CreateMessageInitial extends CreateMessageState {
  @override
  List<Object> get props => [];
}

class CreateMessageSuccess extends CreateMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CreateMessageFailure extends CreateMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CreateMessageProgress extends CreateMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

