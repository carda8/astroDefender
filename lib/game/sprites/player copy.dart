import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';

class Player extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks, KeyboardHandler {
  final int movingLeftInput = -1;
  final int movingRightInput = 1;
  int _wAxisInput = 0;
  Paint paint = Paint()
    ..color = Colors.yellow
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;
  final Vector2 _velocity = Vector2.zero();
  late ShapeHitbox hitbox;
  final _defaultColor = Colors.cyan;

  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(0),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    await add(hitbox);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    _velocity.x = _wAxisInput.toDouble() * 200;
    position += _velocity * dt;

    super.update(dt);
  }

  // @override
  // void render(Canvas canvas) {
  //   // TODO: implement render
  //   super.render(canvas);
  //   Rect rect = const Rect.fromLTRB(10, 100, 110, 300);
  //   canvas.drawRect(rect, paint);
  // }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _wAxisInput = 0;
    // TODO: implement onKeyEvent
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      moveLeft();
    }

    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      moveRight();
    }
    return true;
  }

  void moveLeft() {
    _wAxisInput = 0;
    _wAxisInput += movingLeftInput;
  }

  void moveRight() {
    _wAxisInput = 0;
    _wAxisInput += movingRightInput;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    print("player collision");
  }
}
