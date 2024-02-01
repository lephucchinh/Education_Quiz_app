import 'package:hive/hive.dart';
import 'package:quizgames/domain/user.dart';

class AuthenticationService {

  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');

    await _users.clear();

    await _users.add(User(username: 'lpchinh25@gmail.com', password: "210369", name: 'Admin'));
  }


  Future<String?> authenticateUser(final String username,
      final String password) async {
    final success = await _users.values.any((element) =>
    element.username == username && element.password == password);
    if (success) {
      return username;
    }
    else {
      return null;
    }
  }

  getName(final String username) {
    final name = _users.values.firstWhere((element) => element.username  == username);

      return name.name;

  }

  Future createUser(final String username, final String password,final String name) async {
    final alreadyExists = _users.values.any((element) =>
    element.username.toLowerCase() == username.toLowerCase());

    if(alreadyExists){
      return UserCreationResult.already_exists;
    }

    try{
      _users.add(User(username: username, password: password, name: name));
      return UserCreationResult.success;
    }
    on Exception catch (ex) {
      return UserCreationResult.failure;
    }
  }
}

enum UserCreationResult {
  success,
  failure,
  already_exists,
}

