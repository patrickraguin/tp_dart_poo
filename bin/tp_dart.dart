import 'package:tp_dart/bot.dart';
import 'package:tp_dart/dice.dart';
import 'package:tp_dart/user_input.dart';

void main() {
  final b1 = Bot(100, 1);
  final username = readString('Entrez votre pseudo :');
  var actionCount = 0;
  print('Un bot se présente à vous et veut se battre...\n');
  do {
    readEnter('Appuyez sur entrée pour lancer les dés');
    final dicesValue = rollDices(username);
    b1.health = b1.health - dicesValue;
    print('Bot - ${b1.health}% \n');
    actionCount++;
    print('Fin du tour $actionCount\n');
  } while (b1.health > 0);

  print('Le bot a été vaincu !');
}
