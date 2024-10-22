import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokemon_model.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:poke_app/app/features/pokedex/domain/usecases/get_pokemon_id_usecase.dart';

import '../../../../../resources/fixture.dart';
import 'get_pokemon_id_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokedexRepository>()])
void main() {
  late MockPokedexRepository mockPokedexRepository;
  late GetPokemonIdUsecase getPokemonIdUsecase;

  setUp(() {
    mockPokedexRepository = MockPokedexRepository();
    getPokemonIdUsecase = GetPokemonIdUsecase(mockPokedexRepository);
  });

  final pokemon = PokemonModel.fromJson(fixture('bulbasaur.json'));

  test('call should return pokemon when is Right', () async {
    //Arrange
    when(mockPokedexRepository.getPokemonById(id: '1')).thenAnswer((_) async => Right(pokemon));

    //Act
    final result = await getPokemonIdUsecase.call(GetPokemonIdParams(id: '1'));

    //Assert
    expect(result, isA<Right>());
    expect(result.fold((_) => null, (p) => p), isA<Pokemon>());
  });

  test('call should return Failure when is Left', () async {
    //Arrange
    when(mockPokedexRepository.getPokemonById(id: '1')).thenAnswer((_) async => Left(ApiFailure()));

    //Act
    final result = await getPokemonIdUsecase.call(GetPokemonIdParams(id: '1'));

    //Assert
    expect(result, isA<Left>());
    expect(result.fold((f) => f, (_) => null), isA<ApiFailure>());
  });
}
