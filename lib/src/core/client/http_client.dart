import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestHttp, ResponseHttp, HttpProvider;

/// A simple HTTP client that wraps an [HttpProvider] to make API requests.
///
/// The [HttpClient] simplifies making HTTP requests by exposing convenience
/// methods for common HTTP verbs like GET, POST, PUT, PATCH, and DELETE.
class HttpClient {
  /// Creates an instance of [HttpClient] with the given [provider].
  ///
  /// The [provider] is used to actually perform the HTTP requests.
  HttpClient({
    required this.provider,
  });

  /// The provider used to perform HTTP requests.
  final HttpProvider provider;

  /// Sends an HTTP request using the wrapped [HttpProvider].
  ///
  /// The [req] parameter contains the details of the request, including
  /// HTTP method, endpoint path, and data payload.
  ///
  /// Returns a [ResponseHttp] that wraps the result of the HTTP request.
  /// This method is designed to always return a [ResponseHttp] object,
  /// even in error scenarios.
  Future<ResponseHttp> fetch(RequestHttp req) {
    return provider.fetch(req);
  }
}
