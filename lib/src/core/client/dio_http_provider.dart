import 'package:dio/dio.dart';
import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestHttp, ResponseHttp, HttpProvider;

/// A concrete implementation of [HttpProvider] using the Dio package.
///
/// This class wraps Dio's functionality to match the [HttpProvider]
/// contract for making HTTP requests. It always returns a [ResponseHttp],
/// whether the request is successful or if an error occurs.
class DioHttpProvider extends HttpProvider {
  // Instance of Dio used for making HTTP requests.
  final Dio _dio;

  /// Creates a [DioHttpProvider] with the provided [dio] instance.
  ///
  /// The [dio] instance should be configured with any necessary options
  /// such as base URL, interceptors, timeouts, etc.
  DioHttpProvider({
    required Dio dio,
  }) : _dio = dio;

  /// Makes an HTTP request using Dio.
  ///
  /// The [req] parameter provides details of the request, including
  /// the HTTP method, path, and data.
  ///
  /// Returns a [ResponseHttp] that wraps Dio's response, ensuring that
  /// a response object is always returned, even in error scenarios.
  @override
  Future<ResponseHttp> fetch(RequestHttp req) async {
    try {
      // Execute the HTTP request using Dio.
      final response = await _dio.request(
        '${_dio.options.baseUrl}${req.path}',
        data: req.data?.toJson(),
        options: Options(
          method: req.method.value,
        ),
      );

      // Return the successful response as a ResponseHttp.
      return ResponseHttp(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        headers: response.headers.map,
      );
    } on DioException catch (e) {
      // In case of an error, still return a ResponseHttp with available error details.
      return ResponseHttp(
        statusCode: e.response?.statusCode ?? 400,
        data: e.response?.data,
        headers: e.response?.headers.map ?? {},
      );
    }
  }

  /// Disposes of the Dio client.
  ///
  /// Closes any open connections and cleans up resources.
  void dispose() {
    _dio.close();
  }
}
