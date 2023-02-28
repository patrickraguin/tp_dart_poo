import 'dart:math';

import 'package:tp_dart/dice.dart';
import 'package:tp_dart/player.dart';

class Bot {
  int _health;
  double _strength;

  Bot(this._health, this._strength);

  double get strength => _strength;

  int get health => _health;

  set health(int health) {
    _health = max(0, health);
  }

  bool get isAlive => _health > 0;

  void display() {
    print('Bot - $_health% - Force : ${_strength.toStringAsFixed(1)}');
  }

  void attackPlayer(Player player) {
    final dicesValue = rollDices('Le Bot');
    final int attack = (dicesValue * _strength).round();
    print(
        'Le Bot assène un coup sur le ${player.nickname} avec une force de $attack');
    player.health -= attack;
  }
}
