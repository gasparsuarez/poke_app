import 'package:dio/dio.dart';
import 'package:poke_app/app/core/network/api_paths.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiPaths.baseUrl,
    );
  }
}
