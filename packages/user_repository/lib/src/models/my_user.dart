import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entity/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  String? picture;
  String? coin;

   MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
    this.coin,
  });

  // Empty user which is represents an authenticated user
  static final empty =
      MyUser(id: '', email: '', name: '', picture: '', coin: '');

  // modify MyUser parameters
  MyUser copyWith(
      {String? id,
      String? email,
      String? name,
      String? picture,
      String? coin}) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        picture: picture ?? this.picture,
        coin: coin ?? this.coin);
  }

  /// convenience getter to determine whether the current user is empty
  bool get isEmpty => this == MyUser.empty;

  /// convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(

        id: id, email: email, name: name, picture: picture, coin: coin);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
      coin: entity.coin,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture, coin];

}
