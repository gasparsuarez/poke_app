import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_notifier.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_state.dart';

final listPokemonProvider = StateNotifierProvider<ListPokemonNotifier, ListPokemonState>((ref) {
  final useCase = ref.read(getPokemonUsecaseProvider);

  return ListPokemonNotifier(useCase);
});
