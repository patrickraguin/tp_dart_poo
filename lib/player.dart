import 'package:tp_dart/bot.dart';
import 'package:tp_dart/dice.dart';
import 'package:tp_dart/user_input.dart';

class Player {
  String nickname;
  double strength;
  int health;

  Player(this.nickname, this.health, this.strength);

  void display() {
    print('$nickname - $health% - Force : ${strength.toStringAsFixed(1)}');
  }

  bool get isAlive => health > 0;

  void attackBot(Bot bot) {
    readEnter('Appuyez sur entrée pour lancer les dés');
    final dicesValue = rollDices(nickname);
    final int attack = (dicesValue * strength).round();
    print('$nickname assène un coup sur le bot avec une force de $attack');
    bot.health -= attack;
  }

  void didWin(Bot bot) {
    strength = strength + bot.strength;
    health = (health + 50 * bot.strength).round();
  }
}
