import 'dart:math';

import 'package:tp_dart/bot.dart';
import 'package:tp_dart/dice.dart';
import 'package:tp_dart/player.dart';
import 'package:tp_dart/user_input.dart';

void main() {
  final Bot b1 = Bot(100, 1);

  final String nickname = readString('Entrez votre pseudo :');
  final Player player = Player(nickname, 100, 1);

  int round = 0;
  print('Un bot se présente à vous et veut se battre...\n');
  final bool isItPlayerTurn = Random().nextBool();
  do {
    if (isItPlayerTurn) {
      attackBot(player, b1);
      attackPlayer(b1, player);
    } else {
      attackPlayer(b1, player);
      attackBot(player, b1);
    }

    displayBot(b1);
    displayPlayer(player);
    round++;
    print('Fin du tour $round\n');
  } while (b1.health > 0 && player.health > 0);

  if (player.health > 0) {
    print('${player.nickname} a vaincu le bot !');
  } else {
    print('${player.nickname} a été terrassé par le bot !');
  }
}

void displayPlayer(Player p) {
  print('${p.nickname} - ${p.health}% - Force : ${p.strength}');
}

void displayBot(Bot b) {
  print('Bot - ${b.health}% - Force : ${b.strength}');
}

void attackBot(Player player, Bot bot) {
  readEnter('Appuyez sur entrée pour lancer les dés');
  final dicesValue = rollDices(player.nickname);
  bot.health -= dicesValue;
}

void attackPlayer(Bot bot, Player player) {
  final dicesValue = rollDices('Le Bot');
  player.health -= dicesValue;
}
