import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameManager extends Component {
  ValueNotifier<int> round = ValueNotifier(0);
  ValueNotifier<int> gold = ValueNotifier(0);
  ValueNotifier<double> roundIndicator = ValueNotifier(0.0);

  void nextRound() {
    round.value += 1;
  }

  void addGold() {
    gold.value += 1;
  }

  void setRoundIndicator(double value) {
    roundIndicator.value = value;
  }
}
