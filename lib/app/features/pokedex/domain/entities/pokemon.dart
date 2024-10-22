class Pokemon {
  final int height;
  final int weight;
  final List<Type> types;
  final String name;
  final List<Ability> abilities;
  final List<Stat> stats;
  final int id;

  Pokemon({
    required this.height,
    required this.weight,
    required this.types,
    required this.name,
    required this.id,
    required this.abilities,
    required this.stats,
  });
}

class Stat {
  final int base;
  final String name;

  Stat({required this.base, required this.name});
}

class Ability {
  final String name;

  Ability({required this.name});
}

class Type {
  final String name;

  Type({required this.name});
}
