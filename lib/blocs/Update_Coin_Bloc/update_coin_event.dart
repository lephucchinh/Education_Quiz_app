part of 'update_coin_bloc.dart';

abstract class UpdateCoinEvent extends Equatable {
  const UpdateCoinEvent();
}

class UpdateCoins extends UpdateCoinEvent {

  final int score;
  final String userId;


  const UpdateCoins( {required this.userId,required this.score});

  @override
  List<Object?> get props => [score,userId];

}

