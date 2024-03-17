import 'package:user_repository/user_repository.dart';

import '../entity/entities.dart';

class Post {
  String postID;
  String post;
  DateTime createAt;
  MyUser myUser;
  int likes;
  List<String> likedBy;
  int numberComments;


  Post({
    required this.postID,
    required this.post,
    required this.createAt,
    required this.myUser,
    required this.likes,
    required this.likedBy,
    required this.numberComments
  });

  // Empty user which is represents an authenticated user
  static final empty = Post(
    postID: '',
    post: '',
    myUser: MyUser.empty,
    createAt: DateTime.now(),
    likes: 0,
    likedBy: List<String>.empty().toList(),
    numberComments: 0,
  );

  // modify MyUser parameters
  Post copyWith({
    String? postID,
    String? post,
    MyUser? myUser,
    DateTime? createAt,
    int? likes,
    List<String>? likedBy,
    int? numberComments,
  }) {
    return Post(
      postID: postID ?? this.postID,
      post: post ?? this.post,
      myUser: myUser ?? this.myUser,
      createAt: createAt ?? this.createAt,
      likes: likes ?? this.likes,
      likedBy: likedBy ?? this.likedBy,
      numberComments: numberComments ?? this.numberComments,
    );
  }

  /// convenience getter to determine whether the current user is empty
  bool get isEmpty => this == Post.empty;

  /// convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
      postID: postID,
      post: post,
      myUser: myUser,
      createAt: createAt,
      likes: likes,
      likedBy: likedBy,
      numberComments: numberComments,
    );
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
      postID: entity.postID,
      post: entity.post,
      myUser: entity.myUser,
      createAt: entity.createAt,
      likes: entity.likes,
      likedBy: entity.likedBy,
      numberComments: entity.numberComments,
    );
  }

  List<Object?> get props => [postID, myUser, post,createAt,likes,likedBy,numberComments];
}
