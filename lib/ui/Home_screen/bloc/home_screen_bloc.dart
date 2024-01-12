import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<UpdateCoins>(_onUpdateCoins);
  }
  _onUpdateCoins(UpdateCoins event, Emitter<HomeScreenState> emit) {
  }
}
