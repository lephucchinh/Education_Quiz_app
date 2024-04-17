part of 'delete_chat_bloc.dart';

sealed class DeleteChatState extends Equatable {
  const DeleteChatState();
}

final class DeleteChatInitial extends DeleteChatState {
  @override
  List<Object> get props => [];
}

class DeleteChatProgress extends DeleteChatState {
  @override
  List<Object?> get props => [];
}
class DeleteChatSuccess extends DeleteChatState {

  @override
  List<Object?> get props => [];
}

class DeleteChatFailure extends DeleteChatState {
  @override
  List<Object?> get props => [];

}
