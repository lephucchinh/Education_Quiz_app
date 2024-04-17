part of 'get_message_bloc.dart';

sealed class GetMessageState extends Equatable {
  const GetMessageState();
}

final class GetMessageInitial extends GetMessageState {
  @override
  List<Object> get props => [];
}
class GetMessageProgress extends GetMessageState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class GetMessageSuccess extends GetMessageState {
  final List<Chat> listChat;

  const GetMessageSuccess({required this.listChat});
  @override
  // TODO: implement props
  List<Object?> get props => [listChat];
}

class GetMessageFailure extends GetMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
