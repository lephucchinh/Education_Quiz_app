part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class UpdateCoins extends HomeScreenEvent {
  const UpdateCoins({required this.coins});
  final double coins;
  @override
  List<Object?> get props => [coins];
}

