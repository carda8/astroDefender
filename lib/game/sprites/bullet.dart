import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/sprites/bullet_creator.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flameex22/my_game.dart';

class Bullet extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  final Vector2 enemyPosition;
  Bullet({required super.position, required this.enemyPosition})
      : super(size: Vector2(10, 10), anchor: Anchor.center);
  static const speed = 0.5;
  late final Vector2 velocity;
  final Vector2 deltaPosition = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    add(CircleHitbox()..renderShape = true);
    final direc = enemyPosition - position;
    velocity = direc..scale(speed);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    deltaPosition
      ..setFrom(velocity)
      ..scale(dt);
    position += deltaPosition;

    if (position.y < 0 ||
        position.x > gameRef.size.x ||
        position.x + size.x < 0) {
      // removeFromParent();
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is BulletCreator) removeFromParent();
    if (other is Enemy) removeFromParent();
  }
}
