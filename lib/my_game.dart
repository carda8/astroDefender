import 'dart:async';

import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flameex22/game/components/area_border_comp.dart';
import 'package:flameex22/game/components/bullet_creator.dart';
import 'package:flameex22/game/components/enemy_creator.dart';
import 'package:flameex22/game/components/game_timer.dart';
import 'package:flameex22/game/components/player_comp.dart';
import 'package:flameex22/game/manager/game_manager.dart';
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
  GameManager gameManager = GameManager();

  PlayerComp playerComp = PlayerComp();
  AreaBorder areaBorder = AreaBorder();
  late BulletCreator bulletCreator;
  late GameStageLevelTimer gameStageLevelTimer;
  EnemyCreator enemyCreator = EnemyCreator(period: 0.2);
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
    gameStageLevelTimer = GameStageLevelTimer(gameManager);
    bulletCreator = BulletCreator(period: 0.1);
    return super.onLoad();
  }

  void startGame() {
    overlays.add(gamePlayScreen);
    overlays.remove(mainMenuScreen);
    // enemyCreator = EnemyCreator(period: 1);
    add(playerManager);
    add(objectManager);
    add(playerComp);
    add(areaBorder);
    add(bulletCreator);
    add(enemyCreator);
    // add(gameStageLevelTimer);
  }

  void upgradeAttack() {
    playerManager.upAttackPower(10);
  }

  void upgradeAreaBorder() {
    // print('hi');
    areaBorder.size += Vector2.all(2.5);
  }

  void upgradeBulletSpeed() {
    objectManager.upgradeBulletSpeed();
    // print('object bull ${objectManager.bulletSpeed}');
    // bulletCreator.timer.stop();
    remove(bulletCreator);
    bulletCreator = BulletCreator(period: 0.1);
    add(bulletCreator);
    var sec = objectManager.attackInterval;
    var point = (objectManager.upgradeCound % 10) / 10;
    playerManager.upAttackSpeed(sec + 0.0 + point);
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
  void update(double dt) {
    // TODO: implement update
    if (gameStageLevelTimer.isMounted) {
      gameManager.setRoundIndicator(gameStageLevelTimer.timer.progress);
    }
    super.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    // super.onTapDown(info);
    // final enemy = EnemyComp(
    //   enemySize: Vector2.all(10),
    //   enemyPosition: info.eventPosition.game,
    // );
    // // objectManager.addEnemy(enemy);
    // add(enemy);
  }
}
