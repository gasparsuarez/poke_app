import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/app/core/network/client/api_client.dart';

final apiClientProvider = Provider((ref) => ApiClient());
