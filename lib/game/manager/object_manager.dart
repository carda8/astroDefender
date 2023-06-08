import 'package:flame/components.dart';
import 'package:flameex22/game/components/Enemy_comp.dart';

class ObjectManager extends Component {
  int _count = 0;
  int get count => _count;
  List<EnemyComp> enemies = [];
  double bulletSpeed = 1.0;

  void increment() {
    _count += 1;
  }

  void bulletSpeedUp() {
    if (bulletSpeed > 0.05) {
      bulletSpeed -= 0.025;
      print('bullet speed $bulletSpeed');
    }
  }

  void addEnemy(EnemyComp enemyComp) {
    enemies.add(enemyComp);
  }

  void removeEnemy(EnemyComp enemyComp) {
    enemies.remove(enemyComp);
  }

  List<EnemyComp> get getEnemies => enemies;
}
