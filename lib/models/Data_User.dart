class User {
  final int ranking;
  final int coins;
  final String name;

  User({
    required this.name,
    required this.ranking,
    required this.coins,
  });

  Map<String, dynamic> toMap() {
    return {
      'globalScore': ranking,
      'coins': coins,
      'name': name,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
        ranking: map['globalScore'] ?? 0,
        coins: map['coins'] ?? 0,
        name: map['name']);
  }
}
