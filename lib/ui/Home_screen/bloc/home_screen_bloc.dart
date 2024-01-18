import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizgames/services/total_coins.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final TotalCoinsServices _totalCoinsServices;

  HomeScreenBloc(this._totalCoinsServices) : super(HomeScreenInitial()) {
    on<LoadCoinsEvent>(_onLoadCoinsEvent);
  }

  int coins = 0;
  int coinsAchieve = 0;

  _onLoadCoinsEvent(LoadCoinsEvent event, Emitter<HomeScreenState> emit) {
    final coin = _totalCoinsServices.getCoins(event.username);
    print(event);
    emit(CoinsLoadedState(coin: coin));
    print(coin);
  }
// _onUpdateCoins(UpdateCoins event, Emitter<HomeScreenState> emit) {
//   // (event.coins)/2 because blocListener in ResultScreen called twice
//   coinsAchieve = coinsAchieve + (event.coins) / 2;
//   emit(state.copyWith(coinsAchieve: coinsAchieve));
//   print('event.coins: ${event.coins}');
//   print('coinsAchieve: ${coinsAchieve}');
// }
}
