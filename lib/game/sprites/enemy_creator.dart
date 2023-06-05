import 'dart:math';

import 'package:flame/components.dart';
import 'package:flameex22/game/manager/game_manager.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flameex22/my_game.dart';

class EnemyCreator extends TimerComponent with HasGameRef<MyGame> {
  final GameManager gameManager;
  final List<Enemy> enemies;

  final Random random = Random();

  EnemyCreator(this.gameManager, this.enemies)
      : super(
          period: 1,
          repeat: true,
        );

  @override
  void onTick() {
    // TODO: implement onTick
    // super.onTick();
    print(gameManager.round.value);
    // var posYList = List.generate(gameManager.round.value, (index) {
    //   int y = random.nextInt((gameRef.size.y).floor() + 600) -
    //       300; // -100에서 500 사이의 무작위 y 값 생성
    //   int x;
    //   if (y >= 0 && y <= gameRef.size.y) {
    //     x = [
    //       0,
    //       (gameRef.size.x).floor()
    //     ][random.nextInt(2)]; // 0과 300 중 하나의 값을 선택하여 x 설정
    //   } else {
    //     x = random.nextInt((gameRef.size.x).floor()); // 0에서 300 사이의 무작위 x 값 생성
    //   }
    //   return [x, y];
    // });

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

    gameRef.add(
      Enemy(
          Vector2(
            x * 1.0,
            y * 1.0,
          ),
          gameManager,
          gameRef.size / 2),
    );
    gameRef.enemies.add(
      Enemy(
          Vector2(
            x * 1.0,
            y * 1.0,
          ),
          gameManager,
          gameRef.size / 2),
    );
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
