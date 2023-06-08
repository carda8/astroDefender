import 'dart:async';

import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_comp.dart';
import 'package:flameex22/my_game.dart';

class BulletCreator extends TimerComponent with HasGameRef<MyGame> {
  BulletCreator({required super.period}) : super(repeat: true);

  void beginFire(Vector2 targetPosition) {
    gameRef.add(Bullet(enemyPosition: targetPosition));
  }

  late TimerComponent time;
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    time = TimerComponent(
        period: gameRef.objectManager.bulletSpeed, repeat: true, onTick: tick);
    add(time);

    return super.onLoad();
  }

  void tick() {
    if (gameRef.objectManager.enemies.isNotEmpty) {
      final target = gameRef.objectManager.enemies[0];

      if (target.isRemoved) {
        gameRef.objectManager.removeEnemy(target);
        return;
      } else if (target.isHit) {
        target.isHit = false;
        if (!target.isRemoved) {
          // print(target.position);
          beginFire(target.position);
        }
      }
    }
  }

  @override
  void update(double dt) {
    // TODO: implement update
    // if (time.isDefinedAndNotNull) {
    //   if (time.isRemoved) {}
    // }
    super.update(dt);
  }

  // @override
  // void onTick() {
  //   // TODO: implement onTick
  //   if (gameRef.objectManager.enemies.isNotEmpty) {
  //     final target = gameRef.objectManager.enemies[0];

  //     if (target.isRemoved) {
  //       gameRef.objectManager.removeEnemy(target);
  //       return;
  //     } else if (target.isHit) {
  //       target.isHit = false;
  //       if (!target.isRemoved) {
  //         // print(target.position);
  //         beginFire(target.position);
  //       }
  //     }
  //   }
  //   super.onTick();
  // }
}
