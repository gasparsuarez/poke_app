import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_state.dart';

class ListPokemonNotifier extends StateNotifier<ListPokemonState> {
  ListPokemonNotifier(this.useCase) : super(ListPokemonStateInitial()) {
    listAll();
  }

  final GetPokemonListUsecase useCase;

  Future<void> listAll() async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
    );

    final result = await useCase.call(GetPokemonListParams(limit: 50));

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
