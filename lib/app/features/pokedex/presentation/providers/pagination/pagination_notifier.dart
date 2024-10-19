import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationNotifier extends StateNotifier<bool> {
  PaginationNotifier() : super(true);

  /// Function for set flag when scroll is positioned in max extent or not
  void setMaxScroll(bool value) => state = value;
}
