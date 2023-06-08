import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class EnemyManager extends Component {}

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
