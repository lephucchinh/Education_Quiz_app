
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizgames/services/total_coins.dart';

import '../../../services/authentication.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final AuthenticationService _auth;
  final TotalCoinsServices _coin;

  RegisterScreenBloc(this._auth, this._coin) : super(RegisterScreenInitial()) {
    on<RegisterAccountEvent>(_onRegisterAccountEvent);
    on<RegisterServicesEvent>(_onRegisterServicesEvent);
  }
  _onRegisterAccountEvent(RegisterAccountEvent event,emit) async{
    final result = await  _auth.CreateUser(event.username, event.password);
    switch(result) {
      case UserCreationResult.success:
        _coin.addCoins(event.username);
        emit(SuccessRegisterState(username: event.username));
        break;
      case UserCreationResult.failure:
        emit(FailureRegisterState(error: 'error creating account'));
        break;
      case UserCreationResult.already_exists:
        emit(FailureRegisterState(error: 'account already exists'));
        break;
    }
  }

  _onRegisterServicesEvent(RegisterServicesEvent event, emit) async {
    await _auth.init();
    await _coin.init();
    emit(RegisterScreenInitial());
  }



}
