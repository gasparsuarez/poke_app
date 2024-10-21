import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/domain/use_case.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository_provider.dart';

///
/// [getPokemonIdUsecaseProvider] expose Usecase with repository injection
///
final getPokemonIdUsecaseProvider = Provider((ref) {
  final repository = ref.read(pokedexRepositoryProvider);
  final useCase = GetPokemonIdUsecase(repository);
  return useCase;
});

///
/// [GetPokemonIdUsecase] depends of [PokedexRepository] param injection for work
///
class GetPokemonIdUsecase extends UseCase<Pokemon, GetPokemonIdParams> {
  final PokedexRepository repository;

  GetPokemonIdUsecase(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(params) {
    return repository.getPokemonById(id: params.id);
  }
}

class GetPokemonIdParams {
  final String id;

  GetPokemonIdParams({required this.id});
}
