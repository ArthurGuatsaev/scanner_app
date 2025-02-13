import 'package:test_work/model/fruit_model.dart';

class GameRepository {
  List<FruitModel> gameList = [];
  List<FruitModel> resultList = [];
  int gold = 0;
  int finishedLevels = 0;
  int supportMagnit = 0;
  int supportClock = 0;
  int clock = 0;
  int levelClock = 30;

  void createGame(int level) {
    resultList = [];
    clock = 0;
    levelClock = 30;
    gameList = List.generate(level.levelToCount, (index) => fullFruit[index]);
  }

  void move(FruitModel fruit) {
    // если не того типа фрукт
    if (resultList.isNotEmpty && resultList.first != fruit) return;
    final game = [...gameList];
    final result = [...resultList];
    game.remove(fruit);
    game.add(fruit.copyWith(status: false));
    result.add(fruit);
    resultList = result;
    gameList = game;
  }

  void magnitActive() {
    if (resultList.isEmpty) return;
    if (supportMagnit == 0) return;
    final fruit = resultList.first.copyWith(status: false, index: 1);
    resultList.add(fruit);
    gameList.remove(fruit);
    gameList.add(fruit);
    supportMagnit -= 1;
  }

  void clockActive() {
    if (supportClock == 0) return;
    supportClock -= 1;
    levelClock += 10;
  }

  void clean() => resultList = [];
}

extension on int {
  int get levelToCount => switch (this) {
        1 => 4,
        2 => 6,
        3 => 8,
        4 => 10,
        _ => 6,
      };
}
