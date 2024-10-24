import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_notifier.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/list_pokemon/list_pokemon_state.dart';

///
/// [listPokemonProvider] expose notifier with [GetPokemonListUsecase] injected
///
final listPokemonProvider = StateNotifierProvider<ListPokemonNotifier, ListPokemonState>((ref) {
  final useCase = ref.read(getPokemonListUsecaseProvider);

  return ListPokemonNotifier(useCase);
});
