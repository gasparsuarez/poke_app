import 'package:poke_app/app/core/network/api_paths.dart';
import 'package:poke_app/app/core/network/client/api_client.dart';
import 'package:poke_app/app/features/pokedex/data/models/pokedex_model.dart';

abstract class PokedexDatasource {
  Future<PokedexModel> getPokemonList({int limit = 50});
}

class PokedexDatasourceImpl extends PokedexDatasource {
  final ApiClient client;

  PokedexDatasourceImpl({
    required this.client,
  });

  @override
  Future<PokedexModel> getPokemonList({int limit = 50}) async {
    final result = await client.dio.get('${ApiPaths.getAllPokemon}limit=$limit&offset=0');

    return PokedexModel.fromJson(result.data);
  }
}
