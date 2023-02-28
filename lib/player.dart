import 'dart:math';

import 'package:tp_dart/bot.dart';
import 'package:tp_dart/dice.dart';
import 'package:tp_dart/fighter.dart';
import 'package:tp_dart/user_input.dart';
import 'package:tp_dart/weapon.dart';
import 'package:tp_dart/weapon_list_manager.dart';

class Player extends Fighter {
  final String _nickname;
  Weapon _weapon;
  final WeaponListManager _weaponListManager = WeaponListManager();

  Player(this._nickname, int health, double strength, this._weapon)
      : super(health, strength);

  String get nickname => _nickname;

  @override
  void display() {
    print("$nickname - ");
    super.display();
  }

  void attackBot(Bot bot) {
    final int choice = selectFromMenu('''
    [1] : Attaquer le bot
    [2] : Passer son tour et récupérer 50 points de vie
    ''', 2);

    if (choice == 1) {
      _attack(bot);
    } else {
      health += 50;
      print('$_nickname récupère 50 points de vie !');
    }
  }

  void _attack(Bot bot) {
    final int random = Random().nextInt(100) + 1;
    if (random <= _weapon.accuracy) {
      readEnter('Appuyez sur entrée pour lancer les dés');
      final dicesValue = rollDices(_nickname);
      final int attack = (dicesValue * (strength + _weapon.power)).round();
      print(
          '$_nickname assène un coup sur le bot avec l\'arme ${_weapon.name} et une force de $attack');
      bot.health -= attack;
    } else {
      print('$_nickname n\'a pas réussi à touché le bot !');
    }
  }

  void didWin(Bot bot) {
    strength = strength + bot.strength;
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
