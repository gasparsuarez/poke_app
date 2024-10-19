import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';

class ListPokemonState {
  final bool isLoading;
  final bool hasError;
  final String message;
  final Pokedex? pokedex;

  ListPokemonState({
    this.isLoading = false,
    this.hasError = false,
    this.message = '',
    this.pokedex,
  });

  ListPokemonState copyWith({
    bool? isLoading,
    bool? hasError,
    String? message,
    Pokedex? pokedex,
  }) {
    return ListPokemonState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      message: message ?? this.message,
      pokedex: pokedex ?? this.pokedex,
    );
  }
}

class ListPokemonStateInitial extends ListPokemonState {}
