import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/Enemy_comp.dart';
import 'package:flameex22/my_game.dart';

class PlayerComp extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  PlayerComp()
      : super(
          size: Vector2.all(30),
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() {
    position = gameRef.center;
    final hitbox = CircleHitbox()
      ..paint = debugPaint
      ..size = Vector2(30, 30)
      ..renderShape = true;
    add(hitbox);
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);

    if (other is EnemyComp) {
      gameRef.objectManager.removeEnemy(other);
      gameRef.remove(other);
      print("lenght ${gameRef.objectManager.getEnemies.length}");
    }
  }
}
