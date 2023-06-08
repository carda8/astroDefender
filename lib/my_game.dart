import 'dart:async';

import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flameex22/game/components/Enemy_comp.dart';
import 'package:flameex22/game/components/area_border_comp.dart';
import 'package:flameex22/game/components/bullet_creator.dart';
import 'package:flameex22/game/components/player_comp.dart';
import 'package:flameex22/game/manager/object_manager.dart';
import 'package:flameex22/game/manager/player_manager.dart';
import 'package:flameex22/my_world.dart';
import 'package:flameex22/util/util.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with HasCollisionDetection, TapDetector {
  MyGame({super.children});
  late final Vector2 center;
  MyWorld myWorld = MyWorld();
  ObjectManager objectManager = ObjectManager();
  PlayerManager playerManager = PlayerManager();

  PlayerComp playerComp = PlayerComp();
  AreaBorder areaBorder = AreaBorder();
  late BulletCreator bulletCreator;
  // Player
  // Enemy
  // Magnetic
  // DetectArea ?
  //
  // List<Enemy>
  @override
  FutureOr<void> onLoad() {
    center = size / 2;
    add(myWorld);
    overlays.add(mainMenuScreen);

    return super.onLoad();
  }

  void startGame() {
    overlays.add(gamePlayScreen);
    overlays.remove(mainMenuScreen);
    bulletCreator = BulletCreator(period: 1);
    add(playerManager);
    add(objectManager);
    add(playerComp);
    add(areaBorder);
    add(bulletCreator);
  }

  void timeeer() {
    objectManager.bulletSpeedUp();

    bulletCreator.timer.stop();
    print('object bull ${objectManager.bulletSpeed}');
    bulletCreator = BulletCreator(period: objectManager.bulletSpeed);
    add(bulletCreator);
    bulletCreator.timer.start();
    // bulletCreator.timer.start();
  }

  // @override
  // void update(double dt) {
  //   if (bulletCreator.isRemoved) add(bulletCreator);
  //   // TODO: implement update
  //   super.update(dt);
  // }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);

    canvas.renderPoint(size / 2,
        paint: Paint()
          ..color = Colors.teal
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
        size: 10.0);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(info);
    final enemy = EnemyComp(
      enemySize: Vector2.all(10),
      enemyPosition: info.eventPosition.game,
    );
    // objectManager.addEnemy(enemy);
    add(enemy);
  }
}
