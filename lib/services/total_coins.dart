import 'package:hive/hive.dart';
import 'package:quizgames/domain/coins.dart';

class TotalCoins {
  late Box<Coins> _coins;

  Future<void> init() async {
    Hive.registerAdapter(CoinsAdapter());
    _coins = await Hive.openBox<Coins>('coin');
  }

  getCoins(final String username) {
    final coin = _coins.values.where((element) => element.user == username);
    return coin;
  }

  void addCoins(final double coin, final String username) {
    _coins.add(Coins(user: username, coin: coin));
  }

  Future<void> updateCoins(final double coin, final String username) async {
    final coinsToEdit = _coins.values.firstWhere(
        (element) => element.coin == coin && element.user == username);
    final index = coinsToEdit.key as double;
    await _coins.put(index, Coins(user: username, coin: coin));
  }
}
