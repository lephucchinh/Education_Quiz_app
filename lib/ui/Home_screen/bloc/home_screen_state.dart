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

  const CoinsLoadedState({required this.coin});
  @override
  List<Object?> get props => [coin];

}