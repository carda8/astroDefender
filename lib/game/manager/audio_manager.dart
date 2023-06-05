import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flameex22/game/manager/storage_manager.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/foundation.dart';

enum AudioState { play, muted }

const String basePath = "bgm/";

class AudioManager extends Component with HasGameRef<MyGame> {
  final StorageManager manager;
  AudioManager({required this.manager});

  static const String bgmMain = "${basePath}bgm_space.mp3";
  // static const String bgmSpace = "${basePath}bgm_space.mp3";

  void initAudio(String bgnFileName) async {
    FlameAudio.bgm.initialize();
    // final cachee = FlameAudio.bgm.audioPlayer.audioCache.loadAll(["",""]);
    await FlameAudio.audioCache.loadAll([
      bgmMain,
    ]);
    if (!kIsWeb) {
      final isMuted = manager.getIsBgmMuted;
      if (isMuted == false) {
        await FlameAudio.bgm.play(bgmMain);
      }
    }
  }

  // void setBgmVolume(double volumeSize) async {
  //   await FlameAudio.bgm.audioPlayer.setVolume(volumeSize);
  // }

  void toggleBgmMute(bool value) async {
    // 음향효과는 뮤트값에 따라 시작하거나 시작하지 않는다.
    // 백그라운드 음향은 뮤트값에 따라 플레이 하거나 스탑한다
    if (FlameAudio.bgm.isPlaying) {
      await FlameAudio.bgm.stop();
    } else {
      FlameAudio.bgm.play(bgmMain);
    }
    manager.setIsBgmMuted(value);
  }

  void toggleEffecMute(bool value) async {
    manager.setIsEffectMuted(value);
  }

  void playAudio(String fileName) async {
    final isEffectMuted = manager.getIsEffectMuted;

    if (isEffectMuted != true) {
      FlameAudio.play(fileName);
    }
  }

  /// dispose background sound
  ///
  /// use this method in dispose method of Game Widget
  /// it should be used when game is disposed.
  void dispostAudio() {
    FlameAudio.bgm.dispose();
  }

  bool get audioIsPlaying => FlameAudio.bgm.isPlaying;
}
