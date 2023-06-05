import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/bullet_component.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2 playerPosition;
  PlayerComponent(this.playerPosition) : super(position: playerPosition);

  final Vector2 spriteSize = Vector2.all(40);

  @override
  FutureOr<void> onLoad() async {
    final defaultPain = Paint()..color = Colors.red;
    add(CircleHitbox(radius: 20)
      ..paint = debugPaint
      ..renderShape = true
      ..anchor = Anchor.center);

    // animationComponent.position = gameRef.size / 2;
    final animation = await gameRef.loadSpriteAnimation(
      'game/2500246100.png',
      SpriteAnimationData.sequenced(
        amount: 50,
        textureSize: Vector2.all(100.0),
        stepTime: 0.1,
        loop: true,
      ),
    );

    final animationComponent = SpriteAnimationComponent(
      anchor: Anchor.center,
      size: spriteSize,
      animation: animation,
    );

    await add(animationComponent);
    // TODO: implement onLoad
    return super.onLoad();
  }

  // void shootAtEnemies() {
  //   for (final enemy in gameRef.enemies) {
  //     if (!enemy.isHit && enemy.isWithinRange()) {
  //       enemy.hit();
  //       final bullet = Bullet(enemyPosition: other.);
  //       add(bullet);
  //       break; // 한번에 한 적만 공격합니다.
  //     }
  //   }
  // }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    final shadowPaint = Paint()
      ..color = Colors.green
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10);
    final shadowRect = Rect.fromCenter(
        center: (gameRef.size / 2).toOffset(),
        width: spriteSize.x,
        height: spriteSize.y);
    canvas.drawOval(shadowRect, shadowPaint);
  }

  //스피드와 타격 여부

  void createMagnetic() {}

  void beginFire(Vector2 intersectionPoints) {
    add(Bullet(enemyPosition: intersectionPoints, playerPosition: position));
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
  }
}
