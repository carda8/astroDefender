import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flameex22/game/sprites/player_planet_magnetic_field.dart';

class PlayerPlanetMagneticFeildCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = 20;
  // EnemyComponent.initialSize.x / 2;
  PlayerPlanetMagneticFeildCreator()
      : super(
          period: 4.5,
          repeat: true,
        );
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad

    return super.onLoad();
  }

  @override
  void onTick() {
    // TODO: implement onTick
    // super.onTick();
    gameRef.add(
      PlayerPlanetMagneticField(),
    );
  }
}
