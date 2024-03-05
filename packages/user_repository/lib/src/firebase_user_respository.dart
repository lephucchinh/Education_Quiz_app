import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'package:user_repository/user_repository.dart';

import 'user_repo.dart';

class FireBaseUserRepository implements UserRepository {
  FireBaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  /// Stream of [MyUser] which will emit the current user when
  /// the authentication state changes
  ///
  /// Emits [MyUser.empty] if the user not authenticated
  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      myUser = myUser.copyWith(id: user.user!.uid, coin: '0');
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return usersCollection.doc(myUserId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadPicture(String file, String userId) async {
    try {
      File imageFile = File(file);

      Reference firebaseStoreRef =
          FirebaseStorage.instance.ref().child('$userId/PP/${userId}_lead');

      await firebaseStoreRef.putFile(imageFile);

      String url = await firebaseStoreRef.getDownloadURL();
      await usersCollection.doc(userId).update({'picture': url});
      return url;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadCoins(String coin, String userId) async {
    try {
      await usersCollection.doc(userId).update({'coin': coin});
      return coin;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchTopUsers() async {

    List<Map<String, dynamic>> userListTop = [];
    try {
      QuerySnapshot querySnapshot = await usersCollection
          .orderBy('coin', descending: true)
          .limit(3)
          .get();

      // Số hạng ban đầu
      int rank = 1;

      querySnapshot.docs.forEach((doc) {
        // Chuyển đổi dữ liệu người dùng thành một Map chỉ chứa tên, điểm và số hạng
        Map<String, dynamic> userData = {
          'rank': rank, // Số hạng của người dùng
          'name': (doc.data() as Map<String,dynamic>)['name'], // Tên của người dùng
          'score': (doc.data() as Map<String,dynamic>)['score'], // Điểm của người dùng
        };
        // Thêm Map này vào danh sách người dùng
        userListTop.add(userData);
        // Tăng số hạng lên mỗi lần lặp
        rank++;
      });
      return userListTop;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    try {
      // Lấy tất cả người dùng từ Firestore và sắp xếp theo điểm số giảm dần
      QuerySnapshot querySnapshot = await usersCollection
          .orderBy('coin', descending: true)
          .get();

      List<Map<String, dynamic>> userList = [];
      int rank = 1;

      // Lặp qua từng người dùng và thêm dữ liệu rank
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> userData = {
          'rank': rank,
          'name': (doc.data() as Map<String,dynamic>)['name'],
          'coin': (doc.data() as Map<String,dynamic>)['coin'],
        };

        userList.add(userData);
        rank++;
      });

      return userList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
