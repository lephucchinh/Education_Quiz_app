import 'package:comment_repository/comment_repository.dart';
import 'package:user_repository/user_repository.dart';

class Comment {
  String commentID;
  String comment;
  MyUser myUser;
  String postID;
  int numberComments;
  List<String> commentBy;
  DateTime createAt;
  List<String> userLikes;
  int numberLikes;

  Comment({
    required this.commentID,
    required this.comment,
    required this.myUser,
    required this.postID,
    required this.numberComments,
    required this.commentBy,
    required this.createAt,
    required this.userLikes,
    required this.numberLikes,
  });

  static final empty = Comment(
    commentID: '',
    comment: '',
    myUser: MyUser.empty,
    postID: '',
    numberComments: 0,
    commentBy: List<String>.empty().toList(),
    createAt: DateTime.now(),
    userLikes: List<String>.empty().toList(),
    numberLikes: 0,
  );

  Comment copyWith({
    String? commentID,
    String? comment,
    MyUser? myUser,
    String? postID,
    int? numberComments,
    List<String>? commentBy,
    DateTime? createAt,
    List<String>? userLikes,
    int? numberLikes,
  }) {
    return Comment(
      commentID: commentID ?? this.commentID,
      comment: comment ?? this.comment,
      myUser: myUser ?? this.myUser,
      postID: postID ?? this.postID,
      numberComments: numberComments ?? this.numberComments,
      commentBy: commentBy ?? this.commentBy,
      createAt: createAt ?? this.createAt,
      userLikes: userLikes ?? this.userLikes,
      numberLikes: numberLikes ?? this.numberLikes,
    );
  }

  /// convenience getter to determine whether the current user is empty
  bool get isEmpty => this == Comment.empty;

  /// convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != Comment.empty;

  CommentEntity toEntity() {
    return CommentEntity(
      commentID: commentID,
      comment: comment,
      myUser: myUser,
      postID: postID,
      numberComments: numberComments,
      commentBy: commentBy,
      createAt: createAt,
      numberLikes: numberLikes,
      userLikes: userLikes,
    );
  }

  static Comment fromEntity(CommentEntity entity) {
    return Comment(
        commentID: entity.commentID,
        comment: entity.comment,
        myUser: entity.myUser,
        postID: entity.postID,
        numberComments: entity.numberComments,
        commentBy: entity.commentBy,
        createAt: entity.createAt,
        userLikes: entity.userLikes,
        numberLikes: entity.numberLikes);
  }

  List<Object?> get props => [
        commentID,
        comment,
        myUser,
        postID,
        numberComments,
        commentBy,
        createAt,
        userLikes,
        numberLikes
      ];
}
