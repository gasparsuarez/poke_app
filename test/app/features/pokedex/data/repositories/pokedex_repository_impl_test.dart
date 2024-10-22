import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/app/core/network/errors/failures.dart';
import 'package:poke_app/app/features/pokedex/data/datasources/pokedex_datasource.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokedex_model.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokemon_model.dart';
import 'package:poke_app/app/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokedex.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';

import '../../../../../resources/fixture.dart';
@GenerateNiceMocks([
  MockSpec<PokedexDatasourceImpl>(),
  MockSpec<PokedexModel>(),
])
import 'pokedex_repository_impl_test.mocks.dart';

void main() {
  late MockPokedexDatasourceImpl mockPokedexDatasourceImpl;
  late PokedexRepositoryImpl pokedexRepositoryImpl;

  setUp(() {
    mockPokedexDatasourceImpl = MockPokedexDatasourceImpl();
    pokedexRepositoryImpl = PokedexRepositoryImpl(dataSource: mockPokedexDatasourceImpl);
  });

  test('getPokemonList should return Pokedex when is success', () async {
    /// Arrange
    when(mockPokedexDatasourceImpl.getPokemonList()).thenAnswer(
      (_) => Future.value(MockPokedexModel()),
    );

    /// Act
    final response = await pokedexRepositoryImpl.getPokemonList(limit: 50);

    /// Asserts
    expect(response, isA<Right>());
    expect(response.fold((_) => null, (pokedex) => pokedex), isA<Pokedex>());
  });

  test('getPokemonList should return ApiFailure when throws error', () async {
    //Arrange
    when(mockPokedexDatasourceImpl.getPokemonList()).thenThrow(Exception());

    //Act
    final result = await pokedexRepositoryImpl.getPokemonList(limit: 50);

    //Assert
    expect(result, isA<Left>());
    expect(result.isLeft(), true);
    final failure = result.fold((failure) => failure, (_) => null);
    expect(failure, isA<ApiFailure>());
    expect(failure!.message, 'Error en la petición');
  });

  test('getPokemonById should return Pokemon when is success', () async {
    final pokemon = PokemonModel.fromJson(fixture('bulbasaur.json'));

    //Arrange
    when(mockPokedexDatasourceImpl.getPokemonById(id: '1'))
        .thenAnswer((_) => Future.value(pokemon));

    //Act
    final result = await pokedexRepositoryImpl.getPokemonById(id: '1');

    //Assert
    final resultValue = result.fold((_) => null, (pokemon) => pokemon);
    expect(result, isA<Right>());
    expect(resultValue, isA<Pokemon>());
    expect(resultValue!.name, 'bulbasaur');
  });

  test('getPokemonById should return ApiFailure when throw exception', () async {
    //Arrange
    when(mockPokedexDatasourceImpl.getPokemonById(id: '1')).thenThrow(Exception());

    //Act
    final result = await pokedexRepositoryImpl.getPokemonById(id: '1');

    //Assert
    final resultValue = result.fold((l) => l, (_) => null);
    expect(result, isA<Left>());
    expect(resultValue, isA<ApiFailure>());
    expect(resultValue!.message, 'Error en la petición');
  });
}
