import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/network/client/api_client_provider.dart';
import 'package:poke_app/app/features/pokedex/data/datasources/pokedex_datasource.dart';

///
/// [pokedexDatasourceProvider] expose datasource with [ApiClient] injected
///
final pokedexDatasourceProvider = Provider<PokedexDatasource>((ref) {
  final client = ref.read(apiClientProvider);
  final pokedexDatasourceImpl = PokedexDatasourceImpl(client: client);
  return pokedexDatasourceImpl;
});
