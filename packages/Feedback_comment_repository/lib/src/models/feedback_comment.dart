import 'package:feedback_comment_repository/feedback_comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class FeedbackComment {
  final String feedback;
  final String feedbackID;
  final MyUser myUser;
  final String postID;
  final String commentID;
  final List<String> likeBy;
  final int numberLike;

  FeedbackComment(
      {required this.feedback,
      required this.feedbackID,
      required this.myUser,
      required this.postID,
      required this.commentID,
      required this.likeBy,
      required this.numberLike});

  static final empty = FeedbackComment(
      feedback: '',
      feedbackID: '',
      myUser: MyUser.empty,
      postID: '',
      commentID: '',
      likeBy: List<String>.empty().toList(),
      numberLike: 0);

  FeedbackComment copyWith(
      {String? feedback,
      String? feedbackID,
      MyUser? myUser,
      String? postID,
      String? commentID,
      List<String>? likeBy,
      int? numberLike}) {
    return FeedbackComment(
        feedback: feedback ?? this.feedback,
        feedbackID: feedbackID ?? this.feedbackID,
        myUser: myUser ?? this.myUser,
        postID: postID ?? this.postID,
        commentID: commentID ?? this.commentID,
        likeBy: likeBy ?? this.likeBy,
        numberLike: numberLike ?? this.numberLike);
  }

  bool get isEmpty => this == FeedbackComment.empty;

  bool get isNotEmpty => this != FeedbackComment.empty;

  FeedbackComment toEntity() {
    return FeedbackComment(
        feedback: feedback,
        feedbackID: feedbackID,
        myUser: myUser,
        postID: postID,
        commentID: commentID,
        likeBy: likeBy,
        numberLike: numberLike);
  }

  static FeedbackComment fromEntity(FeedbackCommentEntity entity) {
    return FeedbackComment(
        feedback: entity.feedback,
        feedbackID: entity.feedbackID,
        myUser: entity.myUser,
        postID: entity.postID,
        commentID: entity.commentID,
        likeBy: entity.likeBy,
        numberLike: entity.numberLike);
  }

  List<Object?> get props =>
      [feedback, feedbackID, myUser, postID, commentID, likeBy, numberLike];
}
