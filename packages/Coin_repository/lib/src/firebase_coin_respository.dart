import 'dart:developer';

import 'package:coin_repository/coin_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

import 'coin_repo.dart';

class FireBaseCoinRepository implements CoinRepository {
  final coinCollection = FirebaseFirestore.instance.collection('Coins');

  @override
  Future<Coin> setCoin(Coin coin) async {
    try {
      coin.userID = MyUser.empty.id;
      coin.coin = '0';
      await coinCollection.doc(coin.userID).set(coin.toEntity().toDocument());
      return coin;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Coin> getCoin(String userID) {
    try {
      return coinCollection.doc(userID).get().then(
          (value) => Coin.fromEntity(CoinEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
