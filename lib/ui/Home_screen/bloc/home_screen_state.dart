part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class CoinsLoadedState extends HomeScreenState {
  final int coin;
  final String name;

  const CoinsLoadedState({required this.name, required this.coin});
  @override
  List<Object?> get props => [coin,name];

}
