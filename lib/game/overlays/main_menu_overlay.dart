import 'package:flame/game.dart';
import 'package:flameex22/main.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class MainMenuOverlay extends StatefulWidget {
  final Game game;
  const MainMenuOverlay({super.key, required this.game});

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(
      reverse: true,
    );

  late final Animation<double> _tween =
      Tween(begin: 1.0, end: 1.05).animate(_animation);

  @override
  void dispose() {
    // TODO: implement dispose
    _animation.dispose();
    super.dispose();
  }

  final myGame = game as MyGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: GestureDetector(
              onTap: () => myGame.onTapSetting(),
              child: Image.asset(
                "assets/images/game/icons/setting.png",
                color: Colors.white.withOpacity(0.9),
                width: 50,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "ASTRO DEFENDER",
                    style: TextStyle(
                      shadows: const [
                        Shadow(
                          // color: Color.fromRGBO(85, 187, 243, 1.0),
                          // color: Color.fromRGBO(11, 27, 49, 1.0),
                          color: Color.fromRGBO(23, 51, 90, 1.0),
                          blurRadius: 2,
                          offset: Offset(7, 7),
                        )
                      ],
                      fontFamily: "NotJamSciMono",
                      fontSize: MediaQuery.of(context).size.width * 0.12,
                      // color: Color.fromRGBO(85, 187, 243, 1.0)
                      color: Colors.white.withOpacity(0.9),
                      // color: Color.fromRGBO(147, 191, 123, 1.0),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                GestureDetector(
                  onTap: () => myGame.startGame(),
                  child: ScaleTransition(
                    scale: _tween,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.55,
                          child: Image.asset(
                            "assets/images/game/main_overlay/main_button.png",
                            width: 250,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          "START",
                          style: TextStyle(
                            height: 1.5,
                            fontFamily: "NotJamSciMono",
                            fontSize: 40,
                            color: Colors.white.withOpacity(0.9),
                            // color: Color.fromRGBO(147, 191, 123, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
