import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_comp.dart';
import 'package:flameex22/my_game.dart';

class BulletCreator extends TimerComponent with HasGameRef<MyGame> {
  BulletCreator({required super.period})
      : super(
          repeat: true,
        );

  void beginFire(Vector2 targetPosition) {
    gameRef.add(Bullet(enemyPosition: targetPosition));
  }

  int firetime = 0;

  @override
  void onTick() {
    // TODO: implement onTick
    super.onTick();
    // beginFire(Vector2(0, 0));
    if (gameRef.objectManager.enemies.isNotEmpty) {
      final target = gameRef.objectManager.enemies.first;
      // if (target.isRemoved) {
      //   // gameRef.objectManager.enemies.removeWhere(
      //   //   (element) => element == target,
      //   // );
      //   gameRef.objectManager.enemies.removeAt(0);
      //   return;
      // }
      // print('is hit ${target.isHit}');
      // print('is removed ${target.isRemoved}');
      if (target.hp > firetime) {
        beginFire(target.position);
        print(DateTime.now().toString());
        firetime++;
      } else {
        firetime = 0;
      }
      return;
      if (target.isHit) {
        target.isHit = false;
        print(1);
        if (!target.isRemoved) {
          // print(DateTime.now().toString());
        } else {
          final targetNext = gameRef.objectManager.enemies.first;
          beginFire(targetNext.position);
        }
      }
    }
  }
}
        // gameRef.objectManager.removeEnemy(target);

  // BulletCreator({required super.period}) : super(repeat: true);

  // late TimerComponent time;
  // @override
  // FutureOr<void> onLoad() {
  //   // TODO: implement onLoad
  //   // time = TimerComponent(
  //   //     period: gameRef.objectManager.bulletSpeed,
  //   //     repeat: true,
  //   //     onTick: tick,
  //   //     autoStart: true);
  //   add(time);

  //   return super.onLoad();
  // }
    // void onti() {
  //   if (gameRef.objectManager.enemies.isNotEmpty) {
  //     final target = gameRef.objectManager.enemies[0];

  //     if (target.isRemoved) {
  //       // gameRef.objectManager.removeEnemy(target);
  //       gameRef.objectManager.enemies.removeAt(0);
  //       return;
  //     } else if (target.isHit) {
  //       target.isHit = false;
  //       if (!target.isRemoved) {
  //         print(DateTime.now().toString());
  //         beginFire(target.position);
  //       }
  //     }
  //   }
  // }

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