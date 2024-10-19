import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/features/home/presentation/providers/pagination_notifier.dart';

final paginationNotifierProvider =
    StateNotifierProvider<PaginationNotifier, bool>((ref) => PaginationNotifier());
