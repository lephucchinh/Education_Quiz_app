import 'dart:async';


import 'package:user_repository/user_repository.dart';

import '../post_repository.dart';

abstract class PostRepository {
  Future<Post> createPost(Post post);
  Stream<List<Post>> getPost();
  Future<void> deletePost(Post post);
  Future<void> likesPost(String postID , String userID );
  Future<void> unlikesPost(String postID , String userID );
  Future<void> increaseNumberComment(String postID);
  Future<void> decreaseNumberComment(String postID);
  Future<void> uploadPicture(String picture,Post post);
  Future<void> sendPushNotification(List<MyUser?>  myUsers, String title, String myToken);
}