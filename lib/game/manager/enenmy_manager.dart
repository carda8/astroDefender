import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class EnemyManager extends Component {
  final enemyLevel = {
    1: Enemy(
      color: Colors.white,
      // hp: 1,
      hp: 1,
      size: Vector2.all(10),
      speed: 30,
    ),
    2: Enemy(
      color: Colors.deepOrange,
      // hp: 2,
      hp: 1,
      size: Vector2.all(10),
      speed: 70,
    ),
    3: Enemy(
      color: Colors.deepPurple,
      // hp: 4,
      hp: 1,
      size: Vector2.all(14),
      speed: 30,
    ),
    4: Enemy(
      color: Colors.blue,
      // hp: 4,
      hp: 1,
      size: Vector2.all(14),
      speed: 50,
    ),
    5: Enemy(
      color: Colors.lime,
      // hp: 12,
      hp: 1,
      size: Vector2.all(16),
      speed: 40,
    ),
    6: Enemy(
      color: Colors.yellow,
      // hp: 12,
      hp: 1,
      size: Vector2.all(16),
      speed: 60,
    ),
    7: Enemy(
      color: Colors.pink,
      // hp: 16,
      hp: 1,
      size: Vector2.all(18),
      speed: 80,
    ),
    8: Enemy(
      color: Colors.red,
      // hp: 30,
      hp: 1,
      size: Vector2.all(25),
      speed: 50,
    ),
  };
}

class Enemy {
  final int hp;
  final double speed;
  final Vector2 size;
  final Color color;
  final Sprite? sprite;
  final bool? hasRotation;

  Enemy(
      {required this.hp,
      required this.speed,
      required this.size,
      required this.color,
      this.sprite,
      this.hasRotation});
}
