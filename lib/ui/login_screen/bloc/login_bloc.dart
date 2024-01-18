
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService _auth;
  final TotalCoinsServices _coin;

  LoginBloc(this._auth, this._coin) : super(RegisteringServicesState()) {
    on<LoginPressEvent>(_onLoginPressEvent);
    on<RegisterServicesEvent>(_onRegisterServicesEvent);

  }

  _onLoginPressEvent (LoginPressEvent event ,  Emitter<LoginState> emit) async {
    final user = await _auth.authenticateUser(event.username, event.password);
    print(event);
    if(user != null ){
      print('1');
      emit(SuccessLoginState(username: user));
      emit(LoginInitial());
    }
  }
  _onRegisterServicesEvent (RegisterServicesEvent event ,  Emitter<LoginState> emit ) async {
    await _auth.init();
    await _coin.init();
    emit(LoginInitial());
  }
}
