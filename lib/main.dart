import 'package:flame/game.dart';
import 'package:flameex22/game/overlays/game_play_overlay.dart';
import 'package:flameex22/game/overlays/setting_overlay.dart';
import 'package:flameex22/my_game.dart';
import 'package:flameex22/game/overlays/main_menu_overlay.dart';
import 'package:flameex22/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Flame.device.setPortraitUpOnly();
  await Flame.device.fullScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flame My EX",
      home: MyAppHome(),
    );
  }
}

final Game game = MyGame();

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
          mainMenuScreen: (context, game) => MainMenuOverlay(game: game),
          gamePlayScreen: (context, game) => GamePalyOverlay(game: game),
          gameSettingScreen: (context, game) => SettingOverlay(game: game),
        },
      ),
    );
  }
}
