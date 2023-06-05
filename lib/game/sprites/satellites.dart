import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

enum SatelliteState { red, yellow }

class Satellites extends SpriteAnimationComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2 posCenter;
  final double circleRadius;
  final double hitboxSize;
  final int numHitboxes;
  final double circleSpeed;
  final SatelliteState satellite;

  Satellites({
    required this.posCenter,
    required this.satellite,
    required this.circleRadius,
    required this.circleSpeed,
    required this.hitboxSize,
    required this.numHitboxes,
  }) : super(anchor: Anchor.center, position: posCenter);

  @override
  double angle = 0.0;
  List hitboxes = [];
  List<ShapeHitbox> hitboxesStrokes = [];

  List animations = [];
  List animationsHitBox = [];

  @override
  FutureOr<void> onLoad() async {
    final angularSpacing = 360 / numHitboxes;

    final animation = await gameRef.loadSpriteAnimation(
      'game/${satellite.name}.png',
      SpriteAnimationData.sequenced(
        amount: 60,
        textureSize: Vector2.all(22.0),
        stepTime: 0.1,
        loop: true,
      ),
    );
    final spriteSize = Vector2.all(22.0);

    final defaultPain = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i < numHitboxes; i++) {
      final animationComponent = SpriteAnimationComponent(
        anchor: Anchor.center,
        size: spriteSize,
        animation: animation,
      );

      final circleHitbox = CircleHitbox(
        anchor: Anchor.center,
        radius: hitboxSize,
      )
        ..paint = defaultPain
        ..renderShape = true;

      final angleRadians = radians(angle + i * angularSpacing);
      animationComponent.x = size.x / 2 + (circleRadius * cos(angleRadians));
      animationComponent.y = size.y / 2 + (circleRadius * sin(angleRadians));

      circleHitbox.x = size.x / 2 + (circleRadius * cos(angleRadians));
      circleHitbox.y = size.y / 2 + (circleRadius * sin(angleRadians));

      // await add(animationComponent);
      // animations.add(animationComponent);

      add(circleHitbox);
      animationsHitBox.add(circleHitbox);
    }

    final circle = CircleComponent(
      radius: circleRadius,
      anchor: Anchor.center,
      paint: Paint()
        ..color = Colors.green.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    add(circle);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    final angularSpacing = 360 / numHitboxes;

    for (int i = 0; i < numHitboxes; i++) {
      // final animation = animations[i];
      final animationHitbox = animationsHitBox[i];

      final angleRadians = radians(angle + i * angularSpacing);
      // animation.x = size.x / 2 + (circleRadius * cos(angleRadians));
      // animation.y = size.y / 2 + (circleRadius * sin(angleRadians));

      animationHitbox.x = size.x / 2 + (circleRadius * cos(angleRadians));
      animationHitbox.y = size.y / 2 + (circleRadius * sin(angleRadians));
    }
    angle += circleSpeed;
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // print("Satellite ======== $other");
  }
}
