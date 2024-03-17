import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class PostEntity {
  String postID;
  String post;
  MyUser myUser;
  DateTime createAt;
  int likes;
  int numberComments;
  List<String> likedBy;

  PostEntity({
    required this.post,
    required this.postID,
    required this.myUser,
    required this.createAt,
    required this.likes,
    required this.likedBy,
    required this.numberComments,
  });

  Map<String, Object?> toDocument() {
    return {
      'postID': postID,
      'post': post,
      'myUser': myUser.toEntity().toDocument(),
      'createAt': createAt,
      'likes' : likes,
      'likedBy' : likedBy,
      'numberComments' : numberComments,
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> doc) {
    return PostEntity(
        postID: doc["postID"] as String,
        myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'])),
        post: doc["post"] as String,
        // fix bug ghi nhầm địa chỉ createAt thành createdAt
        createAt: doc['createAt'] != null
            ? (doc['createAt'] as Timestamp).toDate()
            : DateTime.now(),
        likes: doc["likes"] as int,
      likedBy: List<String>.from(doc['likedBy']) ?? [],
        numberComments: doc["numberComments"] as int,
    );
  }

  @override
  List<Object?> get props => [postID, myUser, post, createAt,likedBy,numberComments];

  @override
  String toString() {
    return '''QuestionEntity: {
      postID: $postID
      myUser: $myUser
      post: $post
      createAt: $createAt
      likes: $likes
      likedBy: $likedBy
      numberComments: $numberComments
    }''';
  }
}
