import 'dart:math';

import 'package:flame/components.dart';
import 'package:flameex22/game/components/enemy_creator.dart';
import 'package:flameex22/game/manager/game_manager.dart';
import 'package:flameex22/my_game.dart';

class GameStageLevelTimer extends TimerComponent with HasGameRef<MyGame> {
  final GameManager gameManager;

  final Random random = Random();
  var enemyCreatorPeriod = 1.0;
  GameStageLevelTimer(this.gameManager)
      : super(period: 3, repeat: true, autoStart: true);

  @override
  void onTick() async {
    var round = gameManager.round.value;

    if (enemyCreatorPeriod < 0.2) return;

    if (round == 0) {
      enemyCreatorPeriod = 1;
    } else {
      enemyCreatorPeriod -= 0.05;
    }

    gameManager.round.value += 1;
    print('eneym $enemyCreatorPeriod');

    if (gameRef.enemyCreator.isMounted) gameRef.remove(gameRef.enemyCreator);
    gameRef.enemyCreator = EnemyCreator(period: enemyCreatorPeriod);
    gameRef.add(gameRef.enemyCreator);
  }
}
