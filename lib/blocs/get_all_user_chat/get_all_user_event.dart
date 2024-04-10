part of 'get_all_user_bloc.dart';

sealed class GetAllUserEvent extends Equatable {
  const GetAllUserEvent();
}

class GetAllUser extends GetAllUserEvent{
  final List<MyUser> listUsers;

  GetAllUser({required this.listUsers});
  @override
  List<Object?> get props => [listUsers];

}