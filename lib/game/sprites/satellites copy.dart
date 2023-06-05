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
  final Color hitboxColor;
  final double circleSpeed;
  final SatelliteState satellite;

  Satellites({
    required this.posCenter,
    required this.satellite,
    required this.hitboxColor,
    required this.circleRadius,
    required this.circleSpeed,
    required this.hitboxSize,
    required this.numHitboxes,
  }) : super(anchor: Anchor.center, position: posCenter);

  @override
  double angle = 0.0;
  List hitboxes = [];
  List<ShapeHitbox> hitboxesStrokes = [];

  @override
  FutureOr<void> onLoad() async {
    debugMode = false;

    // TODO: implement onLoad
    final defaultPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final defaultPaintStroke = Paint()
      ..color = hitboxColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // 궤적에도 충돌 감지가 필요시 사용도
    // final rect = CircleHitbox(
    //   radius: circleRadius,
    //   // position: Vector2(size.x / 2, size.y / 2),
    //   anchor: Anchor.center,
    //   // paint: Paint()
    //   //   ..style = PaintingStyle.stroke
    //   //   ..strokeWidth = 0.2
    //   //   ..color = Colors.amber,
    // )
    //   ..paint = defaultPaint
    //   ..renderShape = true;
    // add(rect);

    // final circle = CircleComponent(
    //   radius: circleRadius,
    //   anchor: Anchor.center,
    //   paint: Paint()
    //     ..color = hitboxColor.withOpacity(0.2)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 1,
    // );
    // add(circle);

    for (int i = 0; i < numHitboxes; i++) {
      // final defaultPaint2 = Paint()
      //   ..color = Colors.green
      //   ..style = PaintingStyle.stroke
      //   ..strokeWidth = 20;

      // final hitbox = CircleHitbox(radius: hitboxSize / 2)
      //   ..paint = defaultPaint
      //   ..renderShape = true;
      // hitboxes.add(hitbox);
      // add(hitbox);

      // final hitboxStroke = CircleHitbox(radius: hitboxSize / 2)
      //   ..paint = defaultPaintStroke
      //   ..renderShape = true;
      // hitboxesStrokes.add(hitboxStroke);
      // add(hitboxStroke);
    }
    // await _loadCharacterSprites();
    // current = SatelliteState.red;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    final angularSpacing = 360 / numHitboxes;

    for (int i = 0; i < numHitboxes; i++) {
      final hitbox = hitboxes[i];
      // final hitboxStroke = hitboxesStrokes[i];

      final angleRadians = radians(angle + i * angularSpacing);
      hitbox.x =
          size.x / 2 + (circleRadius * cos(angleRadians)) - hitboxSize / 2;
      hitbox.y =
          size.y / 2 + (circleRadius * sin(angleRadians)) - hitboxSize / 2;

      // hitboxStroke.x =
      //     size.x / 2 + (circleRadius * cos(angleRadians)) - hitboxSize / 2;
      // hitboxStroke.y =
      //     size.x / 2 + (circleRadius * sin(angleRadians)) - hitboxSize / 2;
    }

    angle += circleSpeed; // Adjust the speed of rotation here
    super.update(dt);
  }

  Future<void> _loadCharacterSprites() async {
    // Load & configure sprite assets

    // final yellow =
    //     await gameRef.loadSprite('game/${satellite}_sprite_sheet.png');
    // animation = <SatelliteState, SpriteAnimation>{
    //   SatelliteState.red: animationComponent1,
    //   // SatelliteState.yellow: yellow,
    // };
  }
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // print("Satllites :::::: $other");
  }
}
