import 'package:user_repository/user_repository.dart';

class FeedbackCommentEntity {
  final String feedback;
  final String feedbackID;
  final MyUser myUser;
  final String postID;
  final String commentID;
  final List<String> likeBy;
  final int numberLike;

  FeedbackCommentEntity(
      {required this.feedback,
      required this.feedbackID,
      required this.myUser,
      required this.postID,
      required this.commentID,
      required this.likeBy,
      required this.numberLike});

  Map<String, Object?> toDocument() {
    return {
      "feedback": feedback,
      "feedbackID": feedbackID,
      "myUser": myUser.toEntity().toDocument(),
      "postID": postID,
      "commentID": commentID,
      "likeBy": likeBy,
      "numberLike": numberLike
    };
  }

  static FeedbackCommentEntity fromDocument(Map<String , dynamic> doc) {
    return FeedbackCommentEntity(
        feedback: doc["feedback"] as String,
        feedbackID: doc["feedbackID"] as String ,
        myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc["myUser"])),
        postID: doc["postID"] as String,
        commentID: doc["commentID"] as String,
        likeBy: List<String>.from(doc["likeBy"]) ?? [],
        numberLike: doc["numberLike"] as int
    );
  }
  @override
  List<Object?> get props => [
    feedback,
    feedbackID,
    myUser,
    postID,
    commentID,
    likeBy,
    numberLike,
  ];

  @override
  String toString() {
    return '''QuestionEntity: {
      feedback: $feedback
      feedbackID: $feedbackID
      myUser: $myUser
      postID: $postID
      commentID: $commentID
      likeBy: $likeBy
      numberLike: $numberLike
    }''';
  }

}
