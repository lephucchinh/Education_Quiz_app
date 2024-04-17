part of 'create_image_post_bloc.dart';

sealed class CreateImagePostState extends Equatable {
  const CreateImagePostState();
}

final class CreateImagePostInitial extends CreateImagePostState {
  @override
  List<Object> get props => [];
}
class CreateImagePostProgress extends CreateImagePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CreateImagePostSuccess extends CreateImagePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CreateImagePostFailure extends CreateImagePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}