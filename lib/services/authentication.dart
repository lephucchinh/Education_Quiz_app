import 'package:hive/hive.dart';
import 'package:quizgames/domain/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');

    await _users.clear();

    await _users.add(User(username: 'testuser1', password: "password"));
    await _users.add(User(username: 'flutterfromscratch', password: 'password'));

  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = await _users.values.any((element) =>
        element.username == username && element.password == password);
    if(success){
      return username;
    }
    else{
      return null;
    }
  }
}
