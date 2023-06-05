import 'package:flame/game.dart';
import 'package:flameex22/game/overlays/game_panel_overlay.dart';
import 'package:flameex22/my_game.dart';
import 'package:flameex22/util/util.dart';
import 'package:flutter/material.dart';

class GamePalyOverlay extends StatefulWidget {
  final Game game;
  const GamePalyOverlay({super.key, required this.game});

  @override
  State<GamePalyOverlay> createState() => _GamePalyOverlayState();
}

class _GamePalyOverlayState extends State<GamePalyOverlay> {
  bool puased = false;

  void togglePause(MyGame game) {
    game.togglePauseState();
    setState(() {
      puased = !puased;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyGame game = widget.game as MyGame;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => togglePause(game),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      // color: Colors.blue.withOpacity(0.2),
                      child: Image.asset(
                        puased
                            ? 'assets/images/game/icons/run.png'
                            : 'assets/images/game/icons/pause.png',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      game.overlays.add(gameSettingScreen);
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      // color: Colors.blue.withOpacity(0.2),
                      child: Image.asset(
                        'assets/images/game/icons/setting.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: game.gameManager.score,
                builder: (context, value, child) => Text(
                  "Score $value",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "NotJamSciSerif",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gold",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "NotJamSciSerif",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gold",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "NotJamSciSerif",
                ),
              )
            ],
          ),
        ),
        const Positioned(bottom: 0, child: GamePanel()),
        if (puased)
          GestureDetector(
            onTap: () => togglePause(game),
            child: Container(
              decoration: const BoxDecoration(color: Colors.black54),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      'assets/images/game/icons/pause.png',
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "PAUSED",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: "NotJamSciSerif",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Touch to Resume",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NotJamSciSerif",
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// Positioned(
//         top: 10,
//         left: 10,
//         child: Image.asset('assets/images/game/Frame.png'),
//       ),
