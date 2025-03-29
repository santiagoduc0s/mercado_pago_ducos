/// A wrapper for HTTP responses.
///
/// The [ResponseHttp] class encapsulates the HTTP response details, including
/// the [statusCode], the response [data], and any response [headers].
class ResponseHttp<T> {
  /// Creates a [ResponseHttp] instance with the given [statusCode], [data],
  /// and optional [headers].
  ///
  /// The [headers] parameter defaults to an empty map if not provided.
  ResponseHttp({
    required this.statusCode,
    required this.data,
    this.headers = const {},
  });

  /// The HTTP status code of the response.
  final int statusCode;

  /// The response data, which can be of any type.
  final T? data;

  /// The headers returned with the HTTP response.
  final Map<String, dynamic> headers;

  /// Indicates whether the response was successful (status code 200-299).
  bool get isOk => statusCode >= 200 && statusCode < 300;

  /// Indicates whether the response was not successful.
  bool get isNotOk => !isOk;
}
