import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokedex_model.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';

import '../../../../../resources/fixture.dart';
import 'get_pokemon_id_usecase_test.mocks.dart';

void main() {
  late MockPokedexRepository repository;
  late GetPokemonListUsecase useCase;
  setUp(() {
    repository = MockPokedexRepository();
    useCase = GetPokemonListUsecase(repository: repository);
  });

  final pokedex = PokedexModel.fromJson(fixture('get_all_pokemon.json'));

  test('call should return Pokedex when is Right', () async {
    //Arrange
    when(repository.getPokemonList(limit: 50)).thenAnswer((_) async => Right(pokedex));

    //Act
    final result = await useCase.call(GetPokemonListParams(limit: 50));

    //Assert
    expect(result, isA<Right>());
    expect(result.fold((_) => null, (p) => p), isA<Pokedex>());
  });

  test('call should return Failure when is Left', () async {
    //Arrange
    when(repository.getPokemonList(limit: 50)).thenAnswer((_) async => Left(ApiFailure()));

    //Act
    final result = await useCase.call(GetPokemonListParams(limit: 50));

    //Assert
    expect(result, isA<Left>());
    expect(result.fold((f) => f, (_) => null), isA<ApiFailure>());
  });
}
