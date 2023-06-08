import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_comp.dart';
import 'package:flameex22/game/components/player_comp.dart';
import 'package:flameex22/my_game.dart';

class EnemyComp extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2 enemySize;
  final Vector2 enemyPosition;

  EnemyComp({required this.enemySize, required this.enemyPosition})
      : super(
          size: enemySize,
          position: enemyPosition,
          anchor: Anchor.center,
        );

  late Vector2 targetPosition;
  late ShapeHitbox enemy2;

  int hp = 1;
  bool isHit = true;
  bool isDead = false;

  @override
  FutureOr<void> onLoad() {
    targetPosition = gameRef.size / 2;

    enemy2 = CircleHitbox()
      ..paint = debugPaint
      ..renderShape = true;

    add(enemy2);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    enemy2.position.moveToTarget((gameRef.size / 2) - position, 40 * dt);
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is Bullet) {
      if (gameRef.objectManager.enemies.isEmpty) return;
      hp = hp - gameRef.playerManager.player.attackPower;
      if (hp <= 0) {
        gameRef.objectManager.enemies.removeAt(0);
        removeFromParent();
        return;
      } else {
        isHit = !isHit;
      }
    }
    if (other is PlayerComp) {
      // removeFromParent();
    }
  }
}
