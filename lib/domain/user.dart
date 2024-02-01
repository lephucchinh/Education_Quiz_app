import 'package:hive/hive.dart';
part 'user.g.dart';


@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String? password;
  @HiveField(2)
  final String? name;

  User({required this.name ,required this.username, required this.password});
}