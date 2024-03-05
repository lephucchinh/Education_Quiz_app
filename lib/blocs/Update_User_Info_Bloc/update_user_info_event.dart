part of 'update_user_info_bloc.dart';

abstract class UpdateUserInfoEvent extends Equatable {
  const UpdateUserInfoEvent();

}

class UpdatePicture extends UpdateUserInfoEvent {
  final String file;
  final String userId;

  const UpdatePicture({required this.file, required this.userId});

  @override
  List<Object> get props => [file , userId];

}

