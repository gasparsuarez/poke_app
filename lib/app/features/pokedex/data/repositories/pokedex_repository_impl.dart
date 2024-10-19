import 'package:dartz/dartz.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/data/datasources/pokedex_datasource.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl extends PokedexRepository {
  final PokedexDatasource dataSource;

  PokedexRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Pokedex>> getPokemonList({required int limit}) async {
    try {
      final response = await dataSource.getPokemonList(limit: limit);
      return Right(response);
    } catch (_) {
      return Left(ApiFailure());
    }
  }
}
