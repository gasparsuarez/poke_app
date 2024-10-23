import 'package:dio/dio.dart';
import 'package:poke_app/app/core/network/api_paths.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio dio;

  ///
  /// Configuration for HTTP Client
  ///
  /// Use [PrettyDioLogger] Interceptor for log body requests and show responses in [kDebugMode]
  ///
  ApiClient({required this.dio}) {
    dio
      ..options = BaseOptions(
        baseUrl: ApiPaths.baseUrl,
      );
    //  ..interceptors.add(PrettyDioLogger(requestBody: true));
  }
}
