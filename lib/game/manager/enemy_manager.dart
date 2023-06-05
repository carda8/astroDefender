// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/components.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

// It won't be a detailed section of the codelab, as its not Flame specific
class LevelManager extends Component with HasGameRef<MyGame> {
  LevelManager({this.selectedLevel = 1, this.level = 1});

  int selectedLevel; // level that the player selects at the beginning
  int level; // current level
  // Configurations for different levels of difficulty,
  //the higher level the further away Dash may need to jump. Since
  // gravity is constant, jumpSpeed needs to accomodate for further distance.
  // Score indicates the score needed to be acheived to "level up"
  final Map<int, EnemyLevel> enemyConfig = {
    1: const EnemyLevel(
      color: Colors.orange,
      damage: 1,
      hp: 1,
      size: 4,
      speed: 1,
      gold: 1,
    ),
    2: const EnemyLevel(
        color: Colors.pink, damage: 1, hp: 1, size: 4, speed: 1, gold: 2),
    3: const EnemyLevel(
        color: Colors.cyan, damage: 1, hp: 1, size: 4, speed: 1, gold: 3),
    4: const EnemyLevel(
        color: Colors.brown, damage: 1, hp: 1, size: 4, speed: 1, gold: 4),
    5: const EnemyLevel(
      color: Colors.orange,
      damage: 1,
      hp: 1,
      size: 4,
      speed: 1,
      gold: 5,
    ),
  };

  int get hp {
    return enemyConfig[level]!.hp;
  }

  Color get color {
    return enemyConfig[level]!.color;
  }

  int get damage {
    return enemyConfig[selectedLevel]!.damage;
  }

  double get speed {
    return enemyConfig[level]!.speed;
  }

  int get size {
    return enemyConfig[level]!.size;
  }

  EnemyLevel get difficulty {
    return enemyConfig[level]!;
  }

  bool shouldLevelUp(int score) {
    int nextLevel = level + 1;

    if (enemyConfig.containsKey(nextLevel)) {
      // return enemyConfig[nextLevel]!.score == score;
    }

    return false;
  }

  List<int> get levels {
    return enemyConfig.keys.toList();
  }

  void increaseLevel() {
    if (level < enemyConfig.keys.length) {
      level++;
    }
  }

  void setLevel(int newLevel) {
    if (enemyConfig.containsKey(newLevel)) {
      level = newLevel;
    }
  }

  void selectLevel(int selectLevel) {
    if (enemyConfig.containsKey(selectLevel)) {
      selectedLevel = selectLevel;
    }
  }

  void reset() {
    level = selectedLevel;
  }
}

class EnemyLevel {
  final int hp;
  final double speed;
  final Color color;
  final int size;
  final int damage;
  final int gold;

  const EnemyLevel({
    required this.hp,
    required this.speed,
    required this.color,
    required this.size,
    required this.damage,
    required this.gold,
  });

  // const EnemyLevel(
  //     {required this.minDistance,
  //     required this.maxDistance,
  //     required this.jumpSpeed,
  //     required this.score});
}
