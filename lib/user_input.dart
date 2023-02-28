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
