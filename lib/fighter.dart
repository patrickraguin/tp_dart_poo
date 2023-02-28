import 'dart:math';

class Fighter {
  int _health;
  double _strength;

  Fighter(this._health, this._strength);

  double get strength => _strength;

  set strength(double strength) {
    _strength = max(0, strength);
  }

  bool get isAlive => health > 0;

  int get health => _health;

  set health(int health) {
    _health = max(0, health);
  }

  void raiseHealth(double factor) {
    final gain = health * factor;
    health = min(100, health + gain.toInt());
  }

  void display() {
    print("| $health% - Force : $strength |");
    print(" ___________________");
    print("");
  }
}
