import '../coin_repository.dart';

abstract class CoinRepository {
  Future<Coin> setCoin(Coin coin);
  Future<Coin> getCoin(String userID);

}