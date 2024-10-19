import 'package:dio/dio.dart';
import 'package:poke_app/app/core/network/api_paths.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
      ),
    )..interceptors.add(
        ///
        /// Interceptor for log requests and responses
        ///
        PrettyDioLogger(
          requestBody: true,
        ),
      );
  }

  /// Getter for use client methods
  Dio get dio => _dio;
}
