import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show HttpMethod;

/// A generic class that represents an HTTP request.
///
/// The [RequestHttp] class encapsulates all the details required to perform
/// an HTTP request, including the URL [path], the [method] (HTTP verb), and
/// optional [data] for the request body, [queryParameters] for URL parameters,
/// and [headers] for additional request headers.
class RequestHttp<T> {
  /// Creates a [RequestHttp] instance with the given parameters.
  ///
  /// The [path] is the endpoint URL, [method] specifies the HTTP method, and
  /// optional parameters [data], [queryParameters], and [headers] provide
  /// additional request details.
  RequestHttp({
    required this.path,
    required this.method,
    this.data,
    this.queryParameters,
    this.headers,
  });

  /// The URL path for the HTTP request.
  final String path;

  /// The HTTP method (e.g., GET, POST) for the request.
  final HttpMethod method;

  /// The data to be sent as the request body.
  final T? data;

  /// Optional query parameters to include in the URL.
  final Map<String, dynamic>? queryParameters;

  /// Optional headers to include in the HTTP request.
  final Map<String, dynamic>? headers;

  /// Creates a copy of this [RequestHttp] with the given fields replaced.
  ///
  /// This method is useful when you want to modify an existing request without
  /// creating a new instance from scratch.
  ///
  /// - [path]: Overrides the current URL path if provided.
  /// - [method]: Overrides the current HTTP method if provided.
  /// - [data]: Overrides the current request body data if provided.
  /// - [queryParameters]: Overrides the current query parameters if provided.
  /// - [headers]: Overrides the current headers if provided.
  RequestHttp copyWith({
    String? path,
    HttpMethod? method,
    T? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return RequestHttp(
      path: path ?? this.path,
      method: method ?? this.method,
      data: data ?? this.data,
      queryParameters: queryParameters ?? this.queryParameters,
      headers: headers ?? this.headers,
    );
  }
}
