import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';

class GetPokemonState {
  final bool isLoading;
  final bool hasError;
  final String message;
  final Pokemon? pokemon;

  GetPokemonState({
    this.isLoading = false,
    this.hasError = false,
    this.message = '',
    this.pokemon,
  });

  GetPokemonState copyWith({
    bool? isLoading,
    bool? hasError,
    String? message,
    Pokemon? pokemon,
  }) {
    return GetPokemonState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      message: message ?? this.message,
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
