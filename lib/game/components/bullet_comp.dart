import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/Enemy_comp.dart';
import 'package:flameex22/game/components/area_border_comp.dart';
import 'package:flameex22/my_game.dart';

class Bullet extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2 enemyPosition;
  Bullet({required this.enemyPosition}) : super(size: Vector2.all(10));

  late ShapeHitbox bullet;
  late Vector2 dir;
  late final Vector2 velocity;

  @override
  FutureOr<void> onLoad() {
    double distance = 10;
    Vector2 pointA = enemyPosition;
    Vector2 pointB = gameRef.center;
    final direction = (pointA - pointB).normalized();
    dir = direction;
    final pointC = pointB + direction * distance;
    velocity = dir..scale(20);
    bullet = CircleHitbox()
      ..paint = debugPaint
      ..renderShape = true;
    position = pointC;
    anchor = Anchor.center;

    add(bullet);
    return super.onLoad();
  }

// 공격 속도와 공격 속도가 빨라서 적을 빨리 맞춰도
// 타이머 가 1초마 이기 때문에 1초마다 바른 탄환이 발사됨
// 총알이 사라질 때 마다 발사가 되면 타겟이 가까이 올 수록 총알이 더럽게 빨리 나감
// 총알 속도와 발사도 동시에 줄여야 하나?
// 총알이 없어지는게 기준이 아니고
// 총알은 무조건 하나씩 발싸 인데
// 총알이 없어졌다고 다시 쏘면
// 남는 시간이 바뀌나?
  @override
  void update(double dt) {
    // position.add(dir * dt * 20);
    position.moveToTarget(enemyPosition, 200 * dt);

    // deltaPosition
    //   ..setFrom(velocity)
    //   ..scale(dt);
    // position += deltaPosition;

    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is EnemyComp) {
      removeFromParent();
      return;
    }
    if (other is AreaBorder) {
      removeFromParent();
      return;
    }
  }
}
