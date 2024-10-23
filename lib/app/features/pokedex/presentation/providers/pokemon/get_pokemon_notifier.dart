import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_id_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_state.dart';

class GetPokemonNotifier extends StateNotifier<GetPokemonState> {
  GetPokemonNotifier(this.useCase) : super(GetPokemonState());

  final GetPokemonIdUsecase useCase;

  Future<void> getPokemonById(String id) async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
      message: '',
    );

    final result = await useCase.call(GetPokemonIdParams(id: id));

    switch (result) {
      case Left():
        state = state.copyWith(
          isLoading: false,
          hasError: true,
          message: result.value.message,
        );
      case Right():
        state = state.copyWith(
          isLoading: false,
          pokemon: result.value,
          currentPokemonId: id,
        );
    }
  }
}
