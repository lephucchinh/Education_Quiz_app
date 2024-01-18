part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class LoadCoinsEvent extends HomeScreenEvent {

  final String username;

  const LoadCoinsEvent( {required this.username,});
  @override
  List<Object?> get props => [username];

}
