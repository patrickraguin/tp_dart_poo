import 'package:tp_dart/dice.dart';
import 'package:tp_dart/player.dart';

class Bot {
  int health;
  double strength;

  Bot(this.health, this.strength);

  bool get isAlive => health > 0;

  void display() {
    print('Bot - $health% - Force : ${strength.toStringAsFixed(1)}');
  }

  void attackPlayer(Player player) {
    final dicesValue = rollDices('Le Bot');
    final int attack = (dicesValue * strength).round();
    print(
        'Le Bot assène un coup sur le ${player.nickname} avec une force de $attack');
    player.health -= attack;
  }
}
