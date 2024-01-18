import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'result_screen_event.dart';
part 'result_screen_state.dart';

class ResultScreenBloc extends Bloc<ResultScreenEvent, ResultScreenState> {
  ResultScreenBloc() : super(ResultScreenInitial()) {
    on<ResultScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
