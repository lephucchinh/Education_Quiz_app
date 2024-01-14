
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<LoginEvent>(_onLoginEvent);
  }
  _onLoginEvent(LoginEvent event, Emitter<AppState> emit) {

  }
}
