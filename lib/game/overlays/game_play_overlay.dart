import 'package:flame/game.dart';
import 'package:flameex22/config/styles.dart';
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
    // game.togglePauseState();
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
                    onTap: () => game.upgradeBulletSpeed(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 100,
                        height: 20,
                        child: ValueListenableBuilder(
                          valueListenable: game.gameManager.roundIndicator,
                          builder: (context, value, child) =>
                              LinearProgressIndicator(
                            minHeight: 10,
                            value: value,
                            backgroundColor: Pallet.primary,
                            color: Pallet.secondary,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: game.gameManager.round,
                        builder: (context, value, child) => Text(
                          "Round ${game.gameManager.round.value}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "NotJamSciSerif",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ValueListenableBuilder(
                        valueListenable: game.gameManager.gold,
                        builder: (context, value, child) => Text(
                          "Gold ${game.gameManager.gold.value}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "NotJamSciSerif",
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Text(
                      //   "Gold",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontFamily: "NotJamSciSerif",
                      //   ),
                      // )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // ValueListenableBuilder(
                      //   valueListenable: ,
                      //   builder: (context, value, child) => Text(
                      //     "Score $value",
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //       fontFamily: "NotJamSciSerif",
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/game/icons/attack.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          ValueListenableBuilder(
                            valueListenable: game.playerManager.attack,
                            builder: (context, value, child) => Text(
                              "$value",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "NotJamSciSerif",
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/game/icons/attack_speed.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          ValueListenableBuilder(
                            valueListenable: game.playerManager.attackSpeed,
                            builder: (context, value, child) => Text(
                              "$value",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "NotJamSciSerif",
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: GamePanel(
              game: widget.game,
            )),
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
