import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';

class ListPokemonState {
  final bool isLoading;
  final bool hasError;
  final String message;
  final Pokedex? pokedex;
  final int currentLimit;
  final bool isLoadingNextPage;
  final bool isLoadedNextPage;

  ListPokemonState({
    this.isLoading = false,
    this.hasError = false,
    this.message = '',
    this.pokedex,
    this.currentLimit = 50,
    this.isLoadingNextPage = false,
    this.isLoadedNextPage = false,
  });

  ListPokemonState copyWith({
    bool? isLoading,
    bool? hasError,
    String? message,
    Pokedex? pokedex,
    int? currentLimit,
    bool? isLoadingNextPage,
    bool? isLoadedNextPage,
  }) {
    return ListPokemonState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      message: message ?? this.message,
      pokedex: pokedex ?? this.pokedex,
      currentLimit: currentLimit ?? this.currentLimit,
      isLoadingNextPage: isLoadingNextPage ?? this.isLoadingNextPage,
      isLoadedNextPage: isLoadedNextPage ?? this.isLoadedNextPage,
    );
  }
}

class ListPokemonStateInitial extends ListPokemonState {}
