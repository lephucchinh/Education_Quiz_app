import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;
  final String? coin;

  const MyUserEntity(
      {required this.coin,
      required this.id,
      required this.email,
      required this.name,
      required this.picture});

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'picture': picture,
      'coin': coin
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        id: doc["id"] as String,
        email: doc["email"] as String,
        name: doc["name"] as String,
        picture: doc["picture"] as String,
        coin: doc["coin"] as String);
  }

  @override
  List<Object?> get props => [id, email, name, picture,coin];
  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
      picture: $picture
      coin: $coin
    }''';

  }
}
