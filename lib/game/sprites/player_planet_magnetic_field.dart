import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class PlayerPlanetMagneticField extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  late final ParticleSystemComponent particleSystem;

  late final ShapeHitbox hitboxCircle;
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad

    particleSystem = ParticleSystemComponent(
      particle: ComputedParticle(
        renderer: (c, particle) => c.drawCircle(
          Offset(gameRef.size.x / 2, gameRef.size.y / 2),
          particle.progress * 10,
          Paint()
            ..style = PaintingStyle.stroke
            ..color = Color.lerp(
              Colors.green,
              Colors.blue,
              particle.progress,
            )!,
        ),
        lifespan: 4,
      ),
    );

    // add(particleSystem);
    final defaultPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    hitboxCircle = CircleHitbox(
        radius: 20.0, anchor: Anchor.center, position: gameRef.size / 2)
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitboxCircle);

    return super.onLoad();
  }

  double toOpasity = 1.0;

  @override
  void update(double dt) {
    // TODO: implement update
    // hitboxCircle.x += 1 * dt;
    // hitboxCircle.y += 1 * dt;
    // hitboxCircle.height += 100 * dt;
    // hitboxCircle.width += 100 * dt;

    if (hitboxCircle.size.x > 200.0) removeFromParent();
    hitboxCircle.size += Vector2(50 * dt, 50 * dt);

    toOpasity -= 000.3 * dt;
    if (toOpasity > 0 && toOpasity > 0.0) {
      hitboxCircle.setOpacity(toOpasity);
    }
    // hitboxCircle.setOpacity(opacity);
    super.update(dt);
  }

  @override
  void onRemove() {
    // TODO: implement onRemove
    super.onRemove();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    // print(":::::::: Magnetic Field ::::::::");
  }
}
