import 'package:flame/components.dart';
import 'package:flameex22/game/components/enemy_creator_child.dart';

class ObjectManager extends Component {
  List<EnemyCreatorChild> enemies = [];

  // 이건 타이머의 주기 라고 생각하고
  // 10번의 업글마다 초당 공격횟수를
  double bulletSpeed = 1.0;
  int bulletPower = 1;
  int attackInterval = 1;
  int upgradeCound = 0;
  void upgradeBulletSpeed() {
    // 10회 업글마다 초당 공격속도가 1씩 증가.
    // 위 식으로 1회당 타이머가 얼마 초 만큼 줄어야 할지 알 수있음
    bulletSpeed = (bulletSpeed -
        ((1 / attackInterval) - (1 / (attackInterval + 1))) / 10);
    // print((1 / attackInterval) - (1 / (attackInterval + 1)));
    upgradeCound += 1;
    if (upgradeCound % 10 == 0) attackInterval += 1;

    print("$bulletSpeed // $upgradeCound // $attackInterval");
    // if (bulletSpeed > 0.51) {
    //   bulletSpeed -= (25 / 1000);
    //   print('bullet speed1 $bulletSpeed');
    // } else if (bulletSpeed > 0.4) {
    //   bulletSpeed -= ((25 * 0.25) / 1000);
    //   print('bullet speed2 $bulletSpeed ${60 / (60 * bulletSpeed)}');
    // } else if (bulletSpeed > 0.3333) {
    //   bulletSpeed -= ((25 * 0.25 * 0.25) / 1000);
    //   print('bullet speed3 $bulletSpeed');
    // }
  }

  void bulletPowerUp() {
    bulletPower += 1;
  }

  // void addEnemy(EnemyComp enemyComp) {
  //   enemies.add(enemyComp);
  // }

  void addEnemy(EnemyCreatorChild enemyComp) {
    enemies.add(enemyComp);
  }

  void removeEnemy(EnemyCreatorChild enemyComp, int key) {
    enemies.removeWhere((element) => element == enemyComp);
    // enemies.remove(enemyComp);
  }

  List<EnemyCreatorChild> get getEnemies => enemies;
}
