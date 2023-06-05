import 'dart:math';

import 'package:flame/components.dart';
import 'package:flameex22/game/manager/game_manager.dart';

class GameStageLevelTimer extends TimerComponent with HasGameRef {
  final GameManager gameManager;

  final Random random = Random();

  GameStageLevelTimer(this.gameManager)
      : super(
          period: 140,
          repeat: true,
        );

  @override
  void onTick() {
    gameManager.round.value += 1;
  }
}
