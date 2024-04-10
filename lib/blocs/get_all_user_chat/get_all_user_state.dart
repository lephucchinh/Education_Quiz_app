part of 'get_all_user_bloc.dart';

sealed class GetAllUserState extends Equatable {
  const GetAllUserState();
}

final class GetAllUserInitial extends GetAllUserState {
  @override
  List<Object> get props => [];
}

class GetAllUserProgress extends GetAllUserState {
  @override
  List<Object?> get props => [];

}
class GetAllUserSuccess extends GetAllUserState {
   final List<MyUser> listUsers;

  const GetAllUserSuccess({required this.listUsers});

   @override
  List<Object?> get props => [listUsers];

}
class GetAllUserFailure extends GetAllUserState {
  @override
  List<Object?> get props => [];

}