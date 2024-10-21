class Pokemon {
  final int height;
  final int weight;
  final List<Type> types;
  final String name;
  final int id;

  Pokemon({
    required this.height,
    required this.weight,
    required this.types,
    required this.name,
    required this.id,
  });
}

class Type {
  final String name;

  Type({required this.name});
}
