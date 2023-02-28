import 'dart:math';

import 'package:tp_dart/bot.dart';
import 'package:tp_dart/player.dart';
import 'package:tp_dart/user_input.dart';

void main() {
  Bot bot = Bot(100, 1);

  final String nickname = readString('Entrez votre pseudo :');
  final Player player = Player(nickname, 100, 1);

  int round = 0;
  int botCount = 0;
  print('Un bot se présente à vous et veut se battre...\n');
  final bool isItPlayerTurn = Random().nextBool();
  do {
    if (isItPlayerTurn) {
      player.attackBot(bot);
      bot.attackPlayer(player);
    } else {
      bot.attackPlayer(player);
      player.attackBot(bot);
    }

    bot.display();
    player.display();

    if (!bot.isAlive) {
      print('${player.nickname} a vaincu le bot !');
      player.didWin(bot);
      bot = Bot(100, bot.strength + Random().nextDouble());
      botCount++;
    }

    round++;
    print('Fin du tour $round');
    print('--------------\n');
  } while (player.isAlive);

  print("${player.nickname} a vaincu $botCount bot(s) avant d'être terrassé");
}
