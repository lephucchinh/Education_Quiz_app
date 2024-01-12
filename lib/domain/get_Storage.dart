import 'dart:convert';
import 'dart:io';

import 'package:quizgames/models/Data_User.dart';

class GetStorage {
  static const String filePath = 'user_data.json';
  Future<List<User>> readUsers() async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonList = json.decode(contents);
        return jsonList.map((json) => User.fromMap(json)).toList();
      }
    } catch (e) {
      print('Error reading file: $e');
    }
    return [];
  }

  Future<void> writeUsers(List<User> users) async {
    try {
      final file = File(filePath);
      final jsonList = users.map((user) => user.toMap()).toList();
      await file.writeAsString(json.encode(jsonList));
    } catch (e) {
      print('Error writing file: $e');
    }
  }

  Future<void> addUser(User user) async {
    final users = await readUsers();
    users.add(user);
    await writeUsers(users);
  }

  Future<void> updateUser(User oldUser, User newUser) async {
    final users = await readUsers();
    final index = users.indexOf(oldUser);
    if (index != -1) {
      users[index] = newUser;
      await writeUsers(users);
    }
  }

  Future<void> deleteUser(User user) async {
    final users = await readUsers();
    users.remove(user);
    await writeUsers(users);
  }

}