import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class PlayerPlanet extends PositionComponent
    with HasGameRef<MyGame>, KeyboardHandler, CollisionCallbacks {
  PlayerPlanet(Vector2 position)
      : super(
          position: position,
          anchor: Anchor.center,
          size: Vector2(40, 40),
        );

  late ShapeHitbox hitbox;

  @override
  FutureOr<void> onLoad() async {
    final sprite = await gameRef.loadSprite('game/Baren.png');
    final animation = await gameRef.loadSpriteAnimation(
      'game/2500246100.png',
      SpriteAnimationData.sequenced(
        amount: 50,
        textureSize: Vector2.all(100.0),
        stepTime: 0.1,
        loop: true,
      ),
    );
    final spriteSize = Vector2.all(40.0);

    final animationComponent = SpriteAnimationComponent(
      anchor: Anchor.center,
      size: spriteSize,
      animation: animation,
    );
    animationComponent.x = size.x / 2;
    animationComponent.y = size.y / 2;

    await add(animationComponent);
    // animations.add(animationComponent);
    // add(
    //   SpriteComponent(
    //     sprite: sprite,
    //     position: size / 2,
    //     size: sprite.srcSize / 2,
    //     anchor: Anchor.center,
    //   ),
    // );
    final defaultPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    hitbox = CircleHitbox()
      ..add(
        GlowEffect(
          1.0,
          EffectController(
            infinite: true,
            duration: 2,
            alternate: true,
          ),
          style: BlurStyle.normal,
        ),
      )
      ..paint = defaultPaint
      ..renderShape = true;

    add(hitbox);

    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    final shadowPaint = Paint()
      ..color = Colors.green
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 6);
    const shadowRect = Rect.fromLTWH(0, 0, 40, 40);
    canvas.drawOval(shadowRect, shadowPaint);
    // canvas.drawOval(shadowRect, shadowPaint);

    // final shadowPaint2 = Paint()
    //   ..color = Colors.lightGreen.withOpacity(0.8)
    //   ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 10);
    // const shadowRect2 = Rect.fromLTWH(0, 0, 40, 40);
    // canvas.drawOval(shadowRect2, shadowPaint2);
    // final shadowShape = ShapeComponent() (
    //   shape: CircleShape(),
    //   position: shapePosition + Vector2.all(5),
    //   size: shapeSize,
    //   paint: BasicPalette.black.withAlpha(100).paint(),
    // );
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // print('PlayerPlanet is colliding .... $other');
  }
  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   // TODO: implement onCollision
  //   super.onCollision(intersectionPoints, other);
  //   print('PlayerPlanet is colliding ....');
  // }
}
