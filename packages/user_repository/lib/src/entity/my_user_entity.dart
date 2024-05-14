import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;
  final String? coin;
  final String? token;
  final bool isOnline;

  const MyUserEntity({
    required this.coin,
    required this.id,
    required this.email,
    required this.name,
    required this.picture,
    required this.token,
    required this.isOnline,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'picture': picture,
      'coin': coin,
      'token': token,
      'isOnline': isOnline,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        id: doc["id"] as String,
        email: doc["email"] as String,
        name: doc["name"] as String,
        picture: doc["picture"] as String,
        coin: doc["coin"] as String,
        token: doc["token"] as String,
        isOnline: doc["isOnline"] as bool);
  }

  @override
  List<Object?> get props => [id, email, name, picture, coin,token,isOnline];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
      picture: $picture
      coin: $coin
      token: $token
      isOnline: $isOnline
    }''';
  }
}
