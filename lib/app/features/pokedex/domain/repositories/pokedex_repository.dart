import 'package:dartz/dartz.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';

abstract class PokedexRepository {
  Future<Either<Failure, Pokedex>> getPokemonList({required int limit});
}
