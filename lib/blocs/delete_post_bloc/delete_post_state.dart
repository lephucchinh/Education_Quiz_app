part of 'delete_post_bloc.dart';

abstract class DeletePostState extends Equatable {
  const DeletePostState();
}

class DeletePostInitial extends DeletePostState {
  @override
  List<Object> get props => [];
}

class DeletePostProgress extends DeletePostState {
  @override
  List<Object?> get props => [];
}

class DeletePostSuccess extends DeletePostState {
  @override
  List<Object?> get props =>  [];
}

class DeletePostFailure extends DeletePostState {
  @override
  List<Object?> get props =>  [];

}