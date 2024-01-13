
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<UpdateCoins>(_onUpdateCoins);




  }
  double coins = 0;
  double coinsAchieve = 0;


  _onUpdateCoins(UpdateCoins event, Emitter<HomeScreenState> emit) {
    // (event.coins)/2 because blocListener in ResultScreen called twice
    coinsAchieve =  coinsAchieve + (event.coins)/2;
    emit(state.copyWith(coinsAchieve: coinsAchieve));
    print('event.coins: ${event.coins}');
    print('coinsAchieve: ${coinsAchieve}');
  }


}
