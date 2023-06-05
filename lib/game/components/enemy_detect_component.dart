import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_component.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class EnemyDetect extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  EnemyDetect();

  List<Enemy> enemies = [];
  int attackIndex = 0;
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    final defaultPain = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.pink;
    final hitArea = CircleHitbox(radius: 120)
      ..paint = defaultPain
      ..renderShape = true;
    // ..renderShape = true;
    hitArea.position = gameRef.size / 2;
    hitArea.anchor = Anchor.center;
    add(hitArea);

    return super.onLoad();
  }

  void beginFire(Vector2 intersectionPoints) async {
    add(Bullet(
        enemyPosition: intersectionPoints, playerPosition: gameRef.size / 2));
  }

  @override
  void update(double dt) async {
    // TODO: implement update
    print('origin ${gameRef.enemies}');
    if (gameRef.enemies.isNotEmpty) {
      if (gameRef.enemies[0].isRemoved) {
        gameRef.enemies.removeAt(0);
        return;
      }
      print("2 ${gameRef.enemies[0].isRemoved} ${gameRef.enemies[0].isHit}");
      if (!gameRef.enemies[0].isRemoved && gameRef.enemies[0].isHit == true) {
        gameRef.enemies[0].isHit = false;
        beginFire(gameRef.enemies[0].position);
      }
    }

    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is Enemy) {
      enemies.add(other);
      gameRef.enemies.add(other);
    }
  }
}
