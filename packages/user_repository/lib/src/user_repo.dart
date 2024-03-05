import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {

  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> resetPassword(String email);

  // setUserData
  Future<void> setUserData(MyUser user);

  // getMyUser
  Future<MyUser> getMyUser(String myUserId);

  Future<String> uploadPicture(String file, String userId);

  Future <String> uploadCoins(String coin, String userId);

  Future <List<Map<String,dynamic>>> fetchTopUsers();

  Future<List<Map<String, dynamic>>> fetchAllUsers();

}