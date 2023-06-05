import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/sprites/bullet.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flutter/material.dart';

class BulletCreator extends PositionComponent
    with HasGameRef, CollisionCallbacks {
  final Random random = Random();
  // EnemyComponent.initialSize.x / 2;
  // late TimerComponent creator;
  List enemiesPos = [];
  var enemyPosition;
  BulletCreator({required super.position})
      : super(
        // period: 1,
        // repeat: true,
        );

  @override
  FutureOr<void> onLoad() {
    // creator = TimerComponent(
    //     period: 0.05, onTick: _onTick, repeat: true, autoStart: false);
    // add(creator);
    // creator.timer.start();
    // TODO: implement onLoad
    final boxPaint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    final hitbox = CircleHitbox(radius: 150, anchor: Anchor.center)
      ..paint = boxPaint
      ..renderShape = true;
    add(hitbox);
    return super.onLoad();
  }

  void _onTick() {
    final position = gameRef.size / 2;

    gameRef.add(
      Bullet(position: position, enemyPosition: enemyPosition),
    );
  }

  void _fireBullet() {
    // creator.timer.start();
    gameRef.add(
      Bullet(position: position, enemyPosition: enemyPosition),
    );
  }

  void _stopBullet() {
    // creator.timer.pause();
  }

  var lastIdx = 0;

  @override
  void update(double dt) {
    // TODO: implement update
    // if (enemiesPos.isNotEmpty) {
    //   if (enemiesPos[0].isRemoved) {
    //     enemiesPos.removeAt(0);
    //   }
    // }
    if (enemiesPos.isNotEmpty) {
      if (enemiesPos[0].isHit) {
        enemiesPos[0].isHit = false;

        gameRef.add(
          Bullet(position: position, enemyPosition: enemiesPos[0].position),
        );
      }
      if (enemiesPos[0].isRemoved) enemiesPos.removeAt(0);
    }

    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // var list = enemiesPos.map((e) => e.isRemoved);
    // print("$list ${list.length}");
    if (other is Enemy) {
      enemiesPos.add(other);
    }
  }
}
