import 'package:user_repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentEntity {
  String commentID;
  String comment;
  MyUser myUser;
  String postID;
  int numberComments;
  List<String> commentBy;
  DateTime createAt;


  CommentEntity({
    required this.commentID,
    required this.comment,
    required this.myUser,
    required this.postID,
    required this.numberComments,
    required this.commentBy,
    required this.createAt,
  });

  Map<String, Object?> toDocument() {
    return {
      "commentID": commentID,
      "comment": comment,
      "myUser": myUser.toEntity().toDocument(),
      "postID": postID,
      "numberComments": numberComments,
      "commentBy": commentBy,
      "createAt": createAt
    };
  }

  static CommentEntity fromDocument(Map<String, dynamic> doc) {
    return CommentEntity(
        commentID: doc["commentID"] as String,
        comment: doc["comment"] as String,
        myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc["myUser"])),
        postID: doc["postID"] as String,
        numberComments: doc["numberComments"] as int,
        commentBy: List<String>.from(doc['commentBy']) ?? [],
        createAt: doc['createAt'] != null
            ? (doc['createAt'] as Timestamp).toDate()
            : DateTime.now(),
    );
  }

  @override
  List<Object?> get props =>
      [commentID, comment, myUser, postID, numberComments, commentBy,createAt];

  @override
  String toString() {
    return '''QuestionEntity: {
      commentID: $commentID
      comment: $comment
      myUser: $myUser
      postID: $postID
      numberComments: $numberComments
      commentBy: $commentBy
      createAt: $createAt
    }''';
  }
}
