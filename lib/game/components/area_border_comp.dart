import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_comp.dart';
import 'package:flameex22/game/components/enemy_creator_child.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class AreaBorder extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  AreaBorder();

  bool isFu = false;

  @override
  FutureOr<void> onLoad() {
    size = Vector2.all(200);
    position = gameRef.center;
    anchor = Anchor.center;

    // final tim = TimerComponent(
    //   period: 1,
    //   repeat: true,
    //   onTick: () => isFu = !isFu,
    // );
    // add(tim);

    final defaultPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.teal;

    final hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;

    add(hitbox);
    return super.onLoad();
  }

  void beginFire(Vector2 targetPosition) {
    gameRef.add(Bullet(enemyPosition: targetPosition));
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // print(other);
    if (other is EnemyCreatorChild) {
      gameRef.objectManager.addEnemy(other);
      // print(gameRef.objectManager.enemies.length);
      // beginFire(other.position);
      // gameRef.add(Bullet(enemyPosition: other.position));
      // print("lenght ${gameRef.objectManager.getEnemies.length}");
      return;
    }
  }
}
