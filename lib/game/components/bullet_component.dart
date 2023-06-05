import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flameex22/game/components/enemy_detect_component.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flameex22/my_game.dart';

class Bullet extends PositionComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final Vector2 enemyPosition;
  final Vector2 playerPosition;
  static const speed = 1.0;
  late final Vector2 velocity;
  final Vector2 deltaPosition = Vector2.zero();

  Bullet({required this.playerPosition, required this.enemyPosition})
      : super(position: playerPosition + (enemyPosition - playerPosition) / 4) {
    // final direction = (enemyPosition - playerPosition).normalized();
    // position.setFrom(playerPosition + direction * 20); // 총알의 초기 위치를 설정합니다.
  }

  @override
  FutureOr<void> onLoad() {
    add(CircleHitbox(radius: 4)
      ..paint = debugPaint
      ..anchor = Anchor.center
      ..renderShape = true);
    // TODO: implement onLoad
    final direc = enemyPosition - playerPosition;
    velocity = direc..scale(speed);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // // TODO: implement update
    // // 경과 시간을 증가시킵니다.
    // elapsed += dt;
    // deltaPosition
    //   ..setFrom(velocity)
    //   ..scale(dt);
    deltaPosition
      ..setFrom(velocity)
      ..scale(dt);
    position += deltaPosition;
    // if (elapsed >= cooldown) {
    //   // 공격 주기가 지났을 때 총알을 적 방향으로 이동시킵니다.
    //   final velocity = Vector2(0, -1) * speed;
    //   position.add(velocity * dt);

    //   // 총알이 화면을 벗어나면 게임에서 제거합니다.
    //   // if (position.y < 0 || position.y > size.y) {
    //   //   removeFromParent();
    //   // }
    // }
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is EnemyDetect) {
      removeFromParent();
      return;
    }
    if (other is Enemy) {
      removeFromParent();
      return;
    }
  }
}
