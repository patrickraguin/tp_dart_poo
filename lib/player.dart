import 'dart:math';

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
    final int choice = selectFromMenu('''
    [1] : Force normale (75% de réussite)
    [2] : Force doublé (50% de réussite)
    [3] : Force divisé par 2 (100% de réussite)
    [4] : Passer son tour et récupérer 50 points de vie
    ''', 4);

    if (choice == 4) {
      health += 50;
      print('$nickname récupère 50 points de vie !');
    } else {
      if (choice == 1) {
        _customAttack(bot, 0.75, 1);
      } else if (choice == 2) {
        _customAttack(bot, 0.50, 2);
      } else {
        _customAttack(bot, 1, 0.5);
      }
    }
  }

  void _customAttack(Bot bot, double chance, double multiplier) {
    final double random = Random().nextDouble();
    if (random <= chance) {
      readEnter('Appuyez sur entrée pour lancer les dés');
      final dicesValue = rollDices(nickname);
      final int attack = (dicesValue * strength * multiplier).round();
      print('$nickname assène un coup sur le bot avec une force de $attack');
      bot.health -= attack;
    } else {
      print('$nickname n\'a pas réussi à touché le bot !');
    }
  }

  void didWin(Bot bot) {
    strength = strength + bot.strength;
    health = (health + 50 * bot.strength).round();
  }
}
