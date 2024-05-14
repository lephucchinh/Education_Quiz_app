import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entity/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  String? picture;
  String? coin;
  String? token;
  bool isOnline;

  MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
    this.coin,
    this.token,
    required this.isOnline,
  });

  // Empty user which is represents an authenticated user
  static final empty = MyUser(
      id: '',
      email: '',
      name: '',
      picture: '',
      coin: '',
      token: '',
      isOnline: true);

  // modify MyUser parameters
  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
    String? coin,
    String? token,
    bool? isOnline,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      coin: coin ?? this.coin,
      token: token ?? this.token,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  /// convenience getter to determine whether the current user is empty
  bool get isEmpty => this == MyUser.empty;

  /// convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
        id: id,
        email: email,
        name: name,
        picture: picture,
        coin: coin,

        isOnline: isOnline,
        token: token
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
      coin: entity.coin,
      token: entity.token,
      isOnline: entity.isOnline,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture, coin, token, isOnline];
}
