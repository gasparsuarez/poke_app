import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/pokedex/presentation/providers/pagination/pagination_notifier.dart';

///
/// [paginationNotifierProvider] expose notifier for handle pagination
///
final paginationNotifierProvider =
    StateNotifierProvider<PaginationNotifier, bool>((ref) => PaginationNotifier());
