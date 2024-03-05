import 'package:hive/hive.dart';
import 'package:quizgames/domain/coins.dart';

class TotalCoinsServices {
  late Box<Coins> _coins;

  Future<void> init() async {
    Hive.registerAdapter(CoinsAdapter());
    _coins = await Hive.openBox<Coins>('coin');

    await _coins.clear();

    await _coins.add(Coins(user: 'lpchinh25@gmail.com', coin: 20.toInt()));
  }

  getCoins(final String username) {
    // nếu trả về 1 giá trị duy nhất nên dùng firstWhere -- kinh nghiệm sau khi fix bug
    final coins =
    _coins.values.firstWhere((element) => element.user == username);
    return coins.coin;
  }

  void addCoins(final String username) {
    _coins.add(Coins(user: username, coin: 0.toInt()));
  }

  Future<void> updateCoins(final String username, final int score) async {
    final coinsToEdit =
    _coins.values.firstWhere((element) => element.user == username);
    final index = coinsToEdit.key as int;
    await _coins.put(index,
        Coins(user: username, coin: coinsToEdit.coin.toInt() + score * 10));
    print("run update coins");
  }
}