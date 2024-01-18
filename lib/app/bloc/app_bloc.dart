import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc() : super(AppState.initial()) {

  }


}
