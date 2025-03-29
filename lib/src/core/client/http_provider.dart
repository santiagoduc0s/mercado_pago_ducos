import 'package:mercado_pago_flowlabs/src/core/client/request_http.dart';
import 'package:mercado_pago_flowlabs/src/core/client/response_http.dart';

/// An abstract class that defines the contract for an HTTP provider.
///
/// Classes that extend [HttpProvider] must implement the [fetch] method,
/// which is responsible for executing an HTTP request using the provided
/// [RequestHttp] and returning a [ResponseHttp] containing the response data.
abstract class HttpProvider {
  /// Executes an HTTP request.
  ///
  /// The [req] parameter is a [RequestHttp] object that encapsulates the
  /// details of the request such as the URL path, HTTP method, and request payload.
  ///
  /// Returns a [Future] that resolves to a [ResponseHttp] object containing
  /// the HTTP response data, including the status code, response body, and headers.
  Future<ResponseHttp> fetch(RequestHttp req);
}
