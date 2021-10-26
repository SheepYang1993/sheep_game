import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';

class Sounds {
  static Future initialize() async {
    if (!kIsWeb) {
      FlameAudio.bgm.initialize();
      await FlameAudio.audioCache.loadAll([
        'sound_bg.mp3',
        // 'attack_player.mp3',
        // 'attack_fire_ball.wav',
        // 'attack_enemy.mp3',
        // 'explosion.wav',
        // 'sound_interaction.wav',
      ]);
    }
  }

  static void playBackgroundSound() async {
    if (kIsWeb) return;
    await FlameAudio.bgm.stop();
    FlameAudio.bgm.play('mhxy_jnyw.mp3');
  }

  static void resumeBackgroundSound() {
    if (kIsWeb) return;
    FlameAudio.bgm.resume();
  }

  static void pauseBackgroundSound() {
    if (kIsWeb) return;
    FlameAudio.bgm.pause();
  }

  static stopBackgroundSound() {
    if (kIsWeb) return;
    return FlameAudio.bgm.stop();
  }

  static void dispose() {
    if (kIsWeb) return;
    FlameAudio.bgm.dispose();
  }
}
