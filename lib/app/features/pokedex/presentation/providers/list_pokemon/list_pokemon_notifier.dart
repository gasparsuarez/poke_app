import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_state.dart';

class ListPokemonNotifier extends StateNotifier<ListPokemonState> {
  ListPokemonNotifier(this.useCase) : super(ListPokemonStateInitial()) {
    listAll();
  }

  final GetPokemonListUsecase useCase;

  ///
  /// When user move scroll to maxExtent, [nextPage] is called and
  ///
  /// fetch new 50 pokemons
  ///
  Future<void> nextPage() async {
    state = state.copyWith(
      isLoadingNextPage: true,
      isLoadedNextPage: false,
    );

    state = state.copyWith(currentLimit: state.currentLimit + 50);
    final result = await useCase.call(GetPokemonListParams(limit: state.currentLimit));

    switch (result) {
      case Left():
        state = state.copyWith(
          message: result.value.message,
        );
        break;
      case Right():

        // Take new results
        final newResults = result.value.results;

        // Take current pokedex and add to results new list of fetched pokemons
        final updatedPokedex = state.pokedex!.copyWith(results: [...newResults]);

        state = state.copyWith(
          isLoadedNextPage: true,
          isLoadingNextPage: false,
          pokedex: updatedPokedex,
        );
        break;
    }
  }

  ///
  /// Fetch pokemon list with [limit] of 50 pokemons per page
  ///
  Future<void> listAll() async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
    );

    final result = await useCase.call(GetPokemonListParams(limit: state.currentLimit));

    switch (result) {
      case Left():
        state = state.copyWith(
          hasError: true,
          isLoading: false,
          message: result.value.message,
        );
        break;
      case Right():
        state = state.copyWith(
          isLoading: false,
          pokedex: result.value,
        );
        break;
    }
  }
}
