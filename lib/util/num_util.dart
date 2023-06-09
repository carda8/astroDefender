import 'dart:math';

class ProbabilityGenerator {
  final Random _rand = Random();

  ProbabilityGenerator();

  bool generateWithProbability(double percent) {
    var randomInt = _rand.nextInt(100) + 1; // generate a number 1-100 inclusive

    if (randomInt <= percent) {
      return true;
    }

    return false;
  }
}
