import 'dart:math';

import 'package:flame/components.dart';
import 'package:flameex22/game/components/enemy_creator_child.dart';
import 'package:flameex22/game/manager/enenmy_manager.dart';

import 'package:flameex22/my_game.dart';
import 'package:flameex22/util/num_util.dart';

class EnemyCreator extends TimerComponent with HasGameRef<MyGame> {
  // final List<Enemy> enemies;

  final Random random = Random();
  final EnemyManager enemyManager = EnemyManager();
  int key = 1;

  EnemyCreator({required super.period})
      : super(
          repeat: true,
        );

  @override
  void onTick() {
    int y = random.nextInt((gameRef.size.y).floor() + 600) -
        300; // -100에서 500 사이의 무작위 y 값 생성
    int x;
    if (y >= 0 && y <= gameRef.size.y) {
      x = [
        0,
        (gameRef.size.x).floor()
      ][random.nextInt(2)]; // 0과 300 중 하나의 값을 선택하여 x 설정
    } else {
      x = random.nextInt((gameRef.size.x).floor()); // 0에서 300 사이의 무작위 x 값 생성
    }
    final probGen = ProbabilityGenerator();
    if (probGen.generateWithProbability(20)) {
      gameRef.add(EnemyCreatorChild(
          key: key,
          enemyConfig: enemyManager.enemyLevel[2]!,
          enemyPosition: Vector2(x * 1.0, y * 1.0)));
    } else if (probGen.generateWithProbability(30)) {
      gameRef.add(EnemyCreatorChild(
          key: key,
          enemyConfig: enemyManager.enemyLevel[3]!,
          enemyPosition: Vector2(x * 1.0, y * 1.0)));
    } else if (probGen.generateWithProbability(40)) {
      gameRef.add(EnemyCreatorChild(
          key: key,
          enemyConfig: enemyManager.enemyLevel[5]!,
          enemyPosition: Vector2(x * 1.0, y * 1.0)));
    } else {
      gameRef.add(EnemyCreatorChild(
          key: key,
          enemyConfig: enemyManager.enemyLevel[1]!,
          enemyPosition: Vector2(x * 1.0, y * 1.0)));
    }
    key++;
    // gameRef.enemies.add(
    //   Enemy(
    //       Vector2(
    //         x * 1.0,
    //         y * 1.0,
    //       ),
    //       gameManager,
    //       gameRef.size / 2),
    // );
    // gameRef.addAll(List.generate(
    //   gameManager.round.value,
    //   (index) => Enemy(
    //     Vector2(
    //       posYList[index][0] * 1.0,
    //       posYList[index][1] * 1.0,
    //     ),
    //     gameManager,
    //   ),
    // ));
  }
}
