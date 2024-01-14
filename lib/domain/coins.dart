import 'package:hive/hive.dart';

part 'coins.g.dart';

@HiveType(typeId: 2)
class Coins extends HiveObject {
  @HiveField(0)
  final String user;
  @HiveField(1)
  final double coin;

  Coins({required this.user, required this.coin});
  
}