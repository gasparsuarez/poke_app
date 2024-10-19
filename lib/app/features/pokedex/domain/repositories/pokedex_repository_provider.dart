import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/data/datasources/pokedex_datasource_provider.dart';
import 'package:poke_app/app/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:poke_app/app/features/pokedex/domain/repositories/pokedex_repository.dart';

final pokedexRepositoryProvider = Provider<PokedexRepository>((ref) {
  final dataSource = ref.read(pokedexDatasourceProvider);
  final pokedexRepositoryImpl = PokedexRepositoryImpl(dataSource: dataSource);

  return pokedexRepositoryImpl;
});
