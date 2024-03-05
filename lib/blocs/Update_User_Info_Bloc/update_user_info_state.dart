part of 'update_user_info_bloc.dart';

abstract class UpdateUserInfoState extends Equatable {
  const UpdateUserInfoState();
}

class UpdateUserInfoInitial extends UpdateUserInfoState {
  @override
  List<Object> get props => [];
}

class UploadPictureFailure extends UpdateUserInfoState {
  @override
  List<Object?> get props => [];
}
class UploadPictureSuccess extends UpdateUserInfoState {
  final String userImage;

   const UploadPictureSuccess({required this.userImage});

  @override
  List<Object?> get props => [userImage];
}
class UploadPictureProcess extends UpdateUserInfoState {
  @override
  List<Object?> get props => [];
}
