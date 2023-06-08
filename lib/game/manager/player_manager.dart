import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerManager extends Component {
  final player = Player(
      hp: 5,
      attackPower: 1,
      attackSpeed: 1,
      hasInnder: false,
      hasOutter: false,
      hasMagetic: false,
      satelliteInnerPower: 1,
      satelliteInnerSpeed: 1,
      satelliteOuterPower: 1,
      satelliteOuterSpeed: 1,
      mageticPower: 1,
      mageticSpeed: 1);

  ValueNotifier<int> attack = ValueNotifier(1);
  ValueNotifier<double> attackSpeed = ValueNotifier(1.0);

  void upAttackPower(int attackPower) {
    player.attackPower += attackPower;
    attack.value = player.attackPower;
  }

  void upAttackSpeed(double attackSpeed) {
    player.attackSpeed += attackSpeed;
    attackSpeed = player.attackSpeed;
  }

  set upHp(int hp) => player.hp += hp;
}

class Player {
  int hp;
  int attackPower;
  double attackSpeed;
  bool hasInnder;
  bool hasOutter;
  bool hasMagetic;
  int satelliteInnerPower;
  double satelliteInnerSpeed;
  int satelliteOuterPower;
  double satelliteOuterSpeed;
  int mageticPower;
  double mageticSpeed;

  Player({
    required this.hp,
    required this.attackPower,
    required this.attackSpeed,
    required this.hasInnder,
    required this.hasOutter,
    required this.hasMagetic,
    required this.satelliteInnerPower,
    required this.satelliteInnerSpeed,
    required this.satelliteOuterPower,
    required this.satelliteOuterSpeed,
    required this.mageticPower,
    required this.mageticSpeed,
  });
}
