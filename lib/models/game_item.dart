import 'package:tz_flutter_game/uitls/game_assets.dart';

class GameItem {
  int currentCount;
  GameItem({this.currentCount = 1});

  void nextNumber() {
    if (currentCount == 5) {
      currentCount = 1;
    } else {
      ++currentCount;
    }
  }

  getAssetViaCount() {
    switch (currentCount) {
      case 1:
        return GameAssets.figure2;
      case 2:
        return GameAssets.figure3;
      case 3:
        return GameAssets.figure4;
      case 4:
        return GameAssets.figure5;
      case 5:
        return GameAssets.figure6;
      default:
    }
  }
}
