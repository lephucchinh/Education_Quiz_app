import 'package:hive/hive.dart';
import 'package:quizgames/domain/user.dart';

class Authentication {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');
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
