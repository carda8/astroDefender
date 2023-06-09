import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_comp.dart';
import 'package:flameex22/game/manager/enenmy_manager.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class EnemyCreatorChild extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2? enemyPosition;
  final Enemy enemyConfig;
  final int key;

  EnemyCreatorChild({
    required this.key,
    required this.enemyPosition,
    required this.enemyConfig,
  }) : super(
          position: enemyPosition,
          anchor: Anchor.center,
        );

  late Vector2 targetPosition;
  late ShapeHitbox enemy2;

  late int hp;
  bool isHit = true;
  bool isDead = false;

  @override
  FutureOr<void> onLoad() {
    targetPosition = gameRef.size / 2;
    size = enemyConfig.size;
    hp = enemyConfig.hp;
    final defaultPaint = Paint()
      ..color = enemyConfig.color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    enemy2 = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;

    add(enemy2);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    enemy2.position
        .moveToTarget((gameRef.size / 2) - position, enemyConfig.speed * dt);
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
      isHit = true;
      if (hp <= 0) {
        gameRef.objectManager.enemies.removeWhere((element) => element == this);
        gameRef.gameManager.addGold();
        removeFromParent();
        return;
      }
    }
    // if (other is PlayerComp) {
    //   removeFromParent();
    // }
  }
}
