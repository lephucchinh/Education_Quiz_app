import 'dart:developer';

import 'package:comment_repository/comment_repository.dart';
import 'package:post_repository/post_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

import 'post_repo.dart';

class FireBasePostRepository implements PostRepository {
  final postCollection = FirebaseFirestore.instance.collection('Posts');
  @override
  Future<Post> createPost(Post post) async {
    try {
      post.postID = const Uuid().v1();
      post.createAt = DateTime.now();

      await postCollection.doc(post.postID).set(post.toEntity().toDocument());
      return post;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Stream<List<Post>> getPost() {
    try {
      return postCollection.orderBy('createAt', descending: true).snapshots().map(
              (snapshot) => snapshot.docs
              .map((doc) => Post.fromEntity(PostEntity.fromDocument(doc.data())))
              .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<void> deletePost(String postID) async {
    try {
      await FirebaseFirestore.instance
          .collection("Comments")
          .doc(postID)
          .collection("comment_In_Post")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

// Sau khi xóa tất cả các documents con, bạn có thể xóa document cha
      await FirebaseFirestore.instance
          .collection("Comments")
          .doc(postID)
          .delete();

      await postCollection.doc(postID).delete();
      // await postCollection
      //     .where("postID", isEqualTo: postID)
      //     .get()
      //     .then((querySnapshot) {
      //   querySnapshot.docs.forEach((element) {
      //     element.reference.delete();
      //   });
      // });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<void> likesPost(String postID, String userID) async {
    try {
      Post post = await postCollection.doc(postID).get().then(
          (value) => Post.fromEntity(PostEntity.fromDocument(value.data()!)));
      int like = post.likes + 1;
      List<String> likedBy = List<String>.from(post.likedBy);
      likedBy.add(userID);
      await postCollection
          .doc(postID)
          .update({"likes": like, "likedBy": likedBy});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<void> unlikesPost(String postID, String userID) async {
    try {
      Post post = await postCollection.doc(postID).get().then(
          (value) => Post.fromEntity(PostEntity.fromDocument(value.data()!)));
      int like = post.likes - 1;

      List<String> updatedLikedBy = List<String>.from(post.likedBy);
      updatedLikedBy.remove(userID);

      await postCollection
          .doc(postID)
          .update({"likes": like, "likedBy": updatedLikedBy});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<void> increaseNumberComment(String postID) async {
    try {
      Post post = await postCollection.doc(postID).get().then(
          (value) => Post.fromEntity(PostEntity.fromDocument(value.data()!)));
      int numberComment = post.numberComments + 1;
      await postCollection
          .doc(postID)
          .update({"numberComments": numberComment});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> decreaseNumberComment(String postID) async {
    try {
      Post post = await postCollection.doc(postID).get().then(
              (value) => Post.fromEntity(PostEntity.fromDocument(value.data()!)));
      int numberComment = post.numberComments - 1;
      await postCollection
          .doc(postID)
          .update({"numberComments": numberComment});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
