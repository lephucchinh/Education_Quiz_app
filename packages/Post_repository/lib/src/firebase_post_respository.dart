import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:comment_repository/comment_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:post_repository/post_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

import 'package:uuid/uuid.dart';

import 'post_repo.dart';

class FireBasePostRepository implements PostRepository {
  final postCollection = FirebaseFirestore.instance.collection('Posts');
  final notification = FirebaseMessaging.instance;

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
      return postCollection
          .orderBy('createAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map(
                  (doc) => Post.fromEntity(PostEntity.fromDocument(doc.data())))
              .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deletePost(Post post) async {
    try {
      await FirebaseFirestore.instance
          .collection("Comments")
          .doc(post.postID)
          .collection("comment_In_Post")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      if (post.picture != '') {
        Reference firebaseStoreRef = FirebaseStorage.instance
            .ref()
            .child("postImage/${post.postID}_lead");
        await firebaseStoreRef.delete();
      }

// Sau khi xóa tất cả các documents con, bạn có thể xóa document cha
      await FirebaseFirestore.instance
          .collection("Comments")
          .doc(post.postID)
          .delete();

      await postCollection.doc(post.postID).delete();
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

  @override
  Future<void> uploadPicture(String picture, Post post) async {
    try {
      post.postID = const Uuid().v1();
      post.createAt = DateTime.now();
      File file = File(picture);
      Reference firebaseStoreRef =
          FirebaseStorage.instance.ref().child('postImage/${post.postID}_lead');
      await firebaseStoreRef.putFile(file);
      String url = await firebaseStoreRef.getDownloadURL();
      post.picture = url;
      post.type = 'image';
      await postCollection.doc(post.postID).set(post.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> sendPushNotification(
      List<MyUser?> myUsers, String title, String myToken) async {
    try {
      // URL và header phụ thuộc vào nhà cung cấp thông báo của bạn
      final url = 'https://fcm.googleapis.com/fcm/send';
      final headers = {
        'Authorization': 'key=AAAAANeFT70:APA91bFMcXywgTpYWakCnVvH6uxLHoZrcX-ze1OuGAOVEKFXWVbRDzjRBSIouEzTSo3dUw_E211jQThb_eMGY-dCzfZ-HoAXPm2yLqXnPLbyKql9XfF-rtWmYx35qpsHMUoGiMmBvLqS',
        'Content-Type': 'application/json',
      };
      log("đã hoạt động");
      for(var myUser in  myUsers) {
        log("đã check myUser");
        if(myUser!.token != myToken ){
          log("đã gửi notification");
          final body = {
            'to': myUser.token,
            'notification': {
              'title': 'Thông báo mới',
              'body': "${title} đã đăng 1 tin mới",
            },
          };
          final response =
          await post(Uri.parse(url), headers: headers, body: jsonEncode(body));
        }
      }


    } catch (e) {
      log(e.toString() + "--------------------------------");
      rethrow;
    }
  }
}
