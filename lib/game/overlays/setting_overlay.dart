import 'package:flame/game.dart';
import 'package:flameex22/my_game.dart';
import 'package:flameex22/util/util.dart';
import 'package:flutter/material.dart';

class SettingOverlay extends StatefulWidget {
  final Game game;
  const SettingOverlay({super.key, required this.game});

  @override
  State<SettingOverlay> createState() => _SettingOverlayState();
}

class _SettingOverlayState extends State<SettingOverlay> {
  bool bgmMute = false;
  bool effectMute = false;

  @override
  void initState() {
    super.initState();
    MyGame game = widget.game as MyGame;
    setState(() {
      bgmMute = game.storageManager.getIsBgmMuted ?? false;
      effectMute = game.storageManager.getIsEffectMuted ?? false;
    });
  }

  void toggleBgm(MyGame game) {
    game.audioManager.toggleBgmMute(!bgmMute);
    print(bgmMute);
    setState(() {
      bgmMute = !bgmMute;
    });
  }

  void toggleEffect(MyGame game) {
    game.audioManager.toggleEffecMute(!bgmMute);
    setState(() {
      effectMute = !effectMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyGame game = widget.game as MyGame;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "BGM SOUND",
                    style: TextStyle(
                      height: 1.5,
                      fontFamily: "NotJamSciMono",
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white.withOpacity(0.9),
                      shadows: const [
                        Shadow(
                          // color: Color.fromRGBO(85, 187, 243, 1.0),
                          // color: Color.fromRGBO(11, 27, 49, 1.0),
                          color: Color.fromRGBO(23, 51, 90, 1.0),
                          blurRadius: 2,
                          offset: Offset(7, 7),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleBgm(game),
                    child: Image.asset(
                      "assets/images/game/icons/mark_x.png",
                      color: bgmMute ? Colors.deepOrange : Colors.white24,
                      width: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(
              //       "EFFECT SOUND",
              //       style: TextStyle(
              //         height: 1.5,
              //         fontFamily: "NotJamSciMono",
              //         fontSize: MediaQuery.of(context).size.width * 0.06,
              //         color: Colors.white.withOpacity(0.9),
              //         shadows: const [
              //           Shadow(
              //             // color: Color.fromRGBO(85, 187, 243, 1.0),
              //             // color: Color.fromRGBO(11, 27, 49, 1.0),
              //             color: Color.fromRGBO(23, 51, 90, 1.0),
              //             blurRadius: 2,
              //             offset: Offset(7, 7),
              //           )
              //         ],
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () => toggleEffect(game),
              //       child: Image.asset(
              //         "assets/images/game/icons/mark_x.png",
              //         width: 40,
              //         color: effectMute ? Colors.deepOrange : Colors.white24,
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (!game.overlays.isActive(gamePlayScreen)) {
                    game.overlays.add(mainMenuScreen);
                  }
                  game.overlays.remove(gameSettingScreen);
                },
                child: Image.asset(
                  "assets/images/game/icons/back.png",
                  width: 40,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
