import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_component.dart';
import 'package:flameex22/game/components/player_component.dart';
import 'package:flameex22/game/manager/game_manager.dart';
import 'package:flameex22/game/sprites/player_planet.dart';
import 'package:flameex22/game/sprites/player_planet_magnetic_field.dart';
import 'package:flameex22/game/sprites/satellites.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class Enemy extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame>, KeyboardHandler {
  late Vector2 velocity;
  final _defaultColor = Colors.cyan;
  late ShapeHitbox hitbox;
  final GameManager gameManager;
  var hp = 2;
  var isHit = true;
  final Vector2 targetPos;

  // speed, size should be changed
  Enemy(Vector2 position, this.gameManager, this.targetPos)
      : super(
          position: position,
          anchor: Anchor.center,
          size: Vector2(8, 8),
        );

  @override
  FutureOr<void> onLoad() {
    paintPlayer();
    final center = gameRef.size / 2;
    velocity = (center - position)..scaleTo(40);
    return super.onLoad();
  }

  void paintPlayer() {
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  void hit() {
    hp--;

    if (hp <= 0) {
      // gameRef.enemies.remove;
      print('hitted and removed');
      removeFromParent();
    }
    print('hitted');
    if (gameRef.enemies.isNotEmpty) {
      gameRef.enemies[0].isHit = true;
    }
  }

  bool isWithinRange() {
    // final poss = gameRef.playerComponent.position;
    // 플레이어와 적 사이의 거리를 계산하여 특정 범위 안에 있는지 확인합니다.
    final distance = (position).distanceTo(targetPos);
    print(position);
    print('DIS $distance');
    return distance <= 150; // 특정 범위는 200으로 설정하였습니다.
  }

  @override
  void update(double dt) {
    // TODO: implement update
    position.add(velocity * dt);
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    print('other :: $other');
    if (other is PlayerPlanet) {
      removeFromParent();
      return;
    }

    if (other is Bullet) {
      hit();
    }

    if (other is PlayerPlanet) {
      if (gameRef.enemies.isNotEmpty) {
        // gameRef.enemies[0].isHit = true;
        if (gameRef.enemies.isNotEmpty) gameRef.enemies.removeAt(0);
      }
      removeFromParent();
      return;
    }

    if (other is PlayerComponent) {
      hit();
      // removeFromParent();
      return;
    }
    if (other is Satellites) {
      gameManager.increaseScore();
      removeFromParent();
      return;
    }

    if (other is PlayerPlanetMagneticField) {
      gameManager.increaseScore();
      removeFromParent();
      return;
    }

    // removeFromParent();
  }
}
