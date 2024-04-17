part of 'create_image_post_bloc.dart';

sealed class CreateImagePostEvent extends Equatable {
  const CreateImagePostEvent();
}
class CreateImagePost extends CreateImagePostEvent {
  final String picture;
  final Post post;

  const CreateImagePost({required this.post, required this.picture});
  @override
  // TODO: implement props
  List<Object?> get props => [picture,post];

}