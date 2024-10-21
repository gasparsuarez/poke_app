import 'package:flutter/material.dart';

class Utils {
  /// This function return pokemon color by type
  ///
  /// Example
  /// ```
  /// final color = getColorByPokemonType('grass')
  /// ```
  ///
  static Color getColorByPokemonType(String type) {
    final colors = {
      'grass': Colors.green,
      'poison': Colors.deepPurple,
      'fire': Colors.orangeAccent,
      'water': Colors.blue,
      'bug': Colors.lightGreen,
      'normal': Colors.brown,
      'electric': Colors.yellow,
      'rock': Colors.grey,
      'fighting': Colors.red,
      'flying': Colors.teal,
      'psychic': Colors.purple,
    };

    return colors[type] ?? Colors.grey;
  }
}
