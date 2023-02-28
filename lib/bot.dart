import 'package:tp_dart/dice.dart';
import 'package:tp_dart/fighter.dart';
import 'package:tp_dart/player.dart';

class Bot extends Fighter {
  Bot(int health, double strength) : super(health, strength);

  @override
  void display() {
    print("Bot - ");
    super.display();
  }

  void attackPlayer(Player player) {
    final dicesValue = rollDices('Le Bot');
    final int attack = (dicesValue * strength).round();
    print(
        'Le Bot assène un coup sur le ${player.nickname} avec une force de $attack');
    player.health -= attack;
  }
}
