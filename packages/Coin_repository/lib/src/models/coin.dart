import 'package:user_repository/user_repository.dart';

import '../entity/entities.dart';

class Coin {
  String userID;
  String coin;
  MyUser myUser;

  Coin({
    required this.userID,
    required this.coin,
    required this.myUser,

  });

  // Empty user which is represents an authenticated user
  static final empty =
  Coin(userID: '', coin: '', myUser: MyUser.empty,);

  // modify MyUser parameters
  Coin copyWith(
      {String? userID,
        String? coin,
        MyUser? myUser,
        }) {
    return Coin(
        userID: userID ?? this.userID,
        coin: coin ?? this.coin,
        myUser: myUser ?? this.myUser,
        );
  }

  /// convenience getter to determine whether the current user is empty
  bool get isEmpty => this == Coin.empty;

  /// convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != Coin.empty;

  CoinEntity toEntity() {
    return CoinEntity(

        userID: userID, coin: coin, myUser: myUser,);
  }

  static Coin fromEntity(CoinEntity entity) {
    return Coin(
      userID: entity.userID,
      coin: entity.coin,
      myUser: entity.myUser,

    );
  }

  List<Object?> get props => [userID, myUser, coin];
}