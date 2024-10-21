class Pokemon {
  final int height;
  final int weight;
  final List<Type> types;
  final String name;
  final List<Ability> abilities;
  final int id;

  Pokemon({
    required this.height,
    required this.weight,
    required this.types,
    required this.name,
    required this.id,
    required this.abilities,
  });
}

class Ability {
  final String name;

  Ability({required this.name});
}

class Type {
  final String name;

  Type({required this.name});
}
