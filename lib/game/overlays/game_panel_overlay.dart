import 'package:flame/game.dart';
import 'package:flameex22/config/styles.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class GamePanel extends StatefulWidget {
  final Game game;

  const GamePanel({super.key, required this.game});

  @override
  State<GamePanel> createState() => _GamePanelState();
}

// 마그네틱 생성 속도, 마그네틱 공격력,
// 지구 쉴드,
class _GamePanelState extends State<GamePanel> {
  final images = [
    Image.asset(
      'assets/images/game/icons/attack.png',
      width: 20,
    ),
    Image.asset(
      'assets/images/game/icons/attack_speed.png',
      width: 20,
    ),
    Image.asset(
      'assets/images/game/icons/attack.png',
      width: 20,
    ),
    Image.asset(
      'assets/images/game/icons/attack_speed.png',
      width: 20,
    ),
    Image.asset(
      'assets/images/game/icons/attack.png',
      width: 20,
    ),
    Image.asset(
      'assets/images/game/icons/attack_speed.png',
      width: 20,
    ),
  ];
  List<String> upgradeLists = ['Attack', 'Attack Speed', 'Area Size'];
  void onTapUpgrade(int index, MyGame game) {
    print(index);
    switch (index) {
      case 0:
        game.upgradeAttack();
        break;
      case 1:
        game.upgradeBulletSpeed();
        break;
      case 2:
        game.upgradeAreaBorder();
        break;
      case 3:
        break;
      case 4:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MyGame game = widget.game as MyGame;
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Container(
              decoration: const BoxDecoration(
                // color: Color(0xff3b8ae9),
                color: Pallet.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: Text(
                  "UPGADE",
                  style: baseFontStyle.copyWith(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(color: Pallet.secondary),
            child: GridView.builder(
              itemCount: 3,
              padding: const EdgeInsets.all(3),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.2, mainAxisExtent: 70),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onTapUpgrade(index, game),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: images[index],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            upgradeLists[index],
                            style: baseFontStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Attack Damege",
                            style: baseFontStyle.copyWith(
                                fontSize: 11, color: Colors.white70),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
