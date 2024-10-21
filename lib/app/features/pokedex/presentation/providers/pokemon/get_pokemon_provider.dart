import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_id_usecase.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_notifier.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pokemon/get_pokemon_state.dart';

final getPokemonProvider = StateNotifierProvider<GetPokemonNotifier, GetPokemonState>(
  (ref) {
    final useCase = ref.read(getPokemonIdUsecaseProvider);
    final notifier = GetPokemonNotifier(useCase);
    return notifier;
  },
);
