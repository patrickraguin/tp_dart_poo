import 'dart:math';

import 'package:tp_dart/bot.dart';
import 'package:tp_dart/dice.dart';
import 'package:tp_dart/user_input.dart';
import 'package:tp_dart/weapon.dart';
import 'package:tp_dart/weapon_list_manager.dart';

class Player {
  final String _nickname;
  double _strength;
  int _health;
  Weapon _weapon;
  final WeaponListManager _weaponListManager = WeaponListManager();

  Player(this._nickname, this._health, this._strength, this._weapon);

  String get nickname => _nickname;

  double get strength => _strength;
  set strength(double strength) {
    _strength = max(0, strength);
  }

  int get health => _health;
  set health(int health) {
    _health = max(0, health);
  }

  void display() {
    print('$_nickname - $_health% - Force : ${_strength.toStringAsFixed(1)}');
  }

  bool get isAlive => _health > 0;

  void attackBot(Bot bot) {
    final int choice = selectFromMenu('''
    [1] : Attaquer le bot
    [2] : Passer son tour et récupérer 50 points de vie
    ''', 2);

    if (choice == 1) {
      _attack(bot);
    } else {
      _health += 50;
      print('$_nickname récupère 50 points de vie !');
    }
  }

  void _attack(Bot bot) {
    final int random = Random().nextInt(100) + 1;
    if (random <= _weapon.accuracy) {
      readEnter('Appuyez sur entrée pour lancer les dés');
      final dicesValue = rollDices(_nickname);
      final int attack = (dicesValue * (_strength + _weapon.power)).round();
      print(
          '$_nickname assène un coup sur le bot avec l\'arme ${_weapon.name} et une force de $attack');
      bot.health -= attack;
    } else {
      print('$_nickname n\'a pas réussi à touché le bot !');
    }
  }

  void didWin(Bot bot) {
    _strength = _strength + bot.strength;
    final Weapon? newWeapon = _weaponListManager.getNextWeaponToLoot();
    if (newWeapon != null) {
      final pickWeaponChoice = selectFromMenu(
          "Le bot a laissé tomber une arme (${newWeapon.description}), tapez 1 pour la ramasser ou 2 pour conserver votre arme actuelle (${_weapon.description})",
          2);
      if (pickWeaponChoice == 1) {
        _weapon = newWeapon;
      }
    }
  }
}
