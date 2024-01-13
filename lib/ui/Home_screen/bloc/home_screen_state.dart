part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState._({required this.coinsAchieve});

  const HomeScreenState.initial({
    this.coinsAchieve = 0,
  });

  final double coinsAchieve;

  HomeScreenState copyWith({
    double? coinsAchieve,
  }) {
    return HomeScreenState._(coinsAchieve: coinsAchieve ?? this.coinsAchieve);
  }

  @override
  List<Object?> get props => [coinsAchieve];
}
