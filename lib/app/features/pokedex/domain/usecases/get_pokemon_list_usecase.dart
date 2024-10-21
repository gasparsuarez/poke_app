import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/domain/use_case.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository_provider.dart';

///
/// [getPokemonListUsecaseProvider] expose Usecase with repository injection
///
final getPokemonListUsecaseProvider = Provider((ref) {
  final repository = ref.read(pokedexRepositoryProvider);
  final useCase = GetPokemonListUsecase(repository: repository);
  return useCase;
});

///
/// [GetPokemonListUsecase] depends of [PokedexRepository] param injection for work
///
class GetPokemonListUsecase extends UseCase<Pokedex, GetPokemonListParams> {
  final PokedexRepository repository;

  GetPokemonListUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Pokedex>> call(params) {
    return repository.getPokemonList(limit: params.limit);
  }
}

class GetPokemonListParams {
  // Pokemon Fetch Limit
  final int limit;

  GetPokemonListParams({
    required this.limit,
  });
}
