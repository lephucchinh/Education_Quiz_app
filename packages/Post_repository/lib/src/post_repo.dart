import 'dart:async';


import '../post_repository.dart';

abstract class PostRepository {
  Future<Post> createPost(Post post);
  Stream<List<Post>> getPost();
  Future<void> deletePost(String postID);
  Future<void> likesPost(String postID , String userID );
  Future<void> unlikesPost(String postID , String userID );
  Future<void> increaseNumberComment(String postID);
  Future<void> decreaseNumberComment(String postID);
  Future<void> uploadPicture(String picture,Post post);
}