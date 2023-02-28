import 'dart:io';

String readString(String answer) {
  print(answer);
  String? value;
  do {
    value = stdin.readLineSync();
  } while (value == null || value.isEmpty);
  return value;
}

void readEnter(String answer) {
  print(answer);
  stdin.readLineSync();
}

int readInt(String answer) {
  int? value;
  do {
    value = int.tryParse(readString(answer));
  } while (value == null);
  return value;
}

int selectFromMenu(String message, int max) {
  int userChoice;
  do {
    print(message);
    userChoice = readInt("Quel est votre choix ?");
    if (userChoice < 1 || userChoice > max) {
      print("Veuillez choisir une valeur comprise entre 1 et $max");
    }
  } while (userChoice < 1 || userChoice > max);
  return userChoice;
}
