import 'package:flame/game.dart';
import 'package:flameex22/game/components/enemy_detect_component.dart';
import 'package:flameex22/game/components/player_component.dart';
import 'package:flameex22/game/manager/audio_manager.dart';
import 'package:flameex22/game/manager/game_manager.dart';
import 'package:flameex22/game/manager/storage_manager.dart';
import 'package:flameex22/game/sprites/enemy.dart';
import 'package:flame/input.dart';
import 'package:flameex22/my_world.dart';
import 'package:flameex22/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyGame extends FlameGame with HasCollisionDetection, TapDetector {
  MyGame({super.children});

  late final SharedPreferences prefs;

  late final Vector2 positionCenter;

  final MyWorld world = MyWorld();
  late final StorageManager storageManager;
  late AudioManager audioManager;
  final GameManager gameManager = GameManager();
  late final PlayerComponent playerComponent;
  List<Enemy> enemies = [];

  @override
  void onLoad() async {
    positionCenter = Vector2(size.x / 2, size.y / 2);
    playerComponent = PlayerComponent(positionCenter);
    try {
      prefs = await SharedPreferences.getInstance();
      storageManager = StorageManager(prefs: prefs);
      audioManager = AudioManager(manager: storageManager);
    } catch (error) {
      if (!kReleaseMode) {
        print("ERROR :: my_game.dart $error");
      }
    }

    await add(world);

    audioManager.initAudio(AudioManager.bgmMain);
    overlays.add(mainMenuScreen);
  }

  void initGame() {}

  void startGame() {
    overlays.remove(mainMenuScreen);
    overlays.add(gamePlayScreen);
    add(playerComponent);
    add(EnemyDetect());
    // add(EnemyCreator(gameManager, enemies));
    // add(ScreenHitbox());
    // add(BulletCreator(position: positionCenter));
    // add(PlayerPlanet(positionCenter));
    // add(
    //   Satellites(
    //     posCenter: positionCenter,
    //     circleRadius: 60.0,
    //     circleSpeed: 0.3,
    //     hitboxSize: 5.0,
    //     numHitboxes: 4,
    //     satellite: SatelliteState.yellow,
    //   ),
    // );
    // add(
    //   Satellites(
    //     posCenter: positionCenter,
    //     circleRadius: 110.0,
    //     circleSpeed: 0.8,
    //     hitboxSize: 5.0,
    //     numHitboxes: 6,
    //     satellite: SatelliteState.red,
    //   ),
    // );
    // add(GameStageLevelTimer(gameManager));

    // add(PlayerPlanetMagneticFeildCreator());
  }

  void onTapSetting() {
    overlays.remove(mainMenuScreen);
    overlays.add(gameSettingScreen);
  }

  void togglePauseState() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    // add(PlayerPlanetMagneticField());
    add(Enemy(info.eventPosition.game, gameManager, size / 2));
  }
}
