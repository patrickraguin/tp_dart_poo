import 'dart:math';

int rollDices(String playerName) {
  final generator = Random();
  final randomNumber = generator.nextInt(6) + 1 + generator.nextInt(6) + 1;
  print('$playerName a lancé les dés et a obtenu la valeur $randomNumber');
  return randomNumber;
}
