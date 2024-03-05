import 'package:user_repository/user_repository.dart';

class CoinEntity {
  final String userID;
  final String coin;
  MyUser myUser;


   CoinEntity(
      {required this.coin,
        required this.userID,
        required this.myUser,
        });

  Map<String, Object?> toDocument() {
    return {
      'userID': userID,
      'coin': coin,
      'myUser': myUser.toEntity().toDocument(),
    };
  }

  static CoinEntity fromDocument(Map<String, dynamic> doc) {
    return CoinEntity(
        userID: doc["userID"] as String,
        myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'])),
        coin: doc["coin"] as String);
  }

  @override
  List<Object?> get props => [userID, myUser,coin];
  @override
  String toString() {
    return '''QuestionEntity: {
      coinID: $userID
      myUser: $myUser
      coin: $coin
    }''';

  }
}