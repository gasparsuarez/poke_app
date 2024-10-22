import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/app/core/network/api_paths.dart';
import 'package:poke_app/app/core/network/client/api_client.dart';
import 'package:poke_app/app/features/pokedex/data/datasources/pokedex_datasource.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokedex_model.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokemon_model.dart';

import '../../../../../resources/fixture.dart';
@GenerateNiceMocks([
  MockSpec<Dio>(),
])
import 'pokedex_datasource_test.mocks.dart';

void main() {
  late MockDio mockDio;
  late ApiClient apiClient;
  late PokedexDatasourceImpl pokedexDatasourceImpl;
  setUpAll(() {
    mockDio = MockDio();
    apiClient = ApiClient(dio: mockDio);
    pokedexDatasourceImpl = PokedexDatasourceImpl(client: apiClient);
  });

  test('getPokemonList should return PokedexModel', () async {
    //Arrange
    when(apiClient.dio.get('${ApiPaths.getAllPokemon}limit=50&offset=0')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        data: fixture('get_all_pokemon.json'),
        statusCode: 200,
      ),
    );
    //Act
    final response = await pokedexDatasourceImpl.getPokemonList();

    //Assert
    expect(response, isA<PokedexModel>());
    expect(response.results.first.name, 'bulbasaur');
  });

  test('getPokemonById should return PokemonModel', () async {
    //Arrange
    const String pokemonId = '1'; // Bulbasaur
    when(apiClient.dio.get('${ApiPaths.getPokemonById}$pokemonId')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        data: fixture('bulbasaur.json'),
        statusCode: 200,
      ),
    );

    //Act
    final response = await pokedexDatasourceImpl.getPokemonById(id: '1');

    //Assert

    expect(response, isA<PokemonModel>());
    expect(response.name, 'bulbasaur');
  });
}
