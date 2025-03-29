/// Enum for HTTP methods.
///
/// This enum defines the common HTTP methods supported by the client,
/// providing both a method to get the string representation of each method
/// and a factory method to convert a string to the corresponding [HttpMethod].
enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
  options,
  trace,
  connect;

  /// Returns the uppercase string representation of the [HttpMethod].
  ///
  /// For example, [HttpMethod.get] returns `'GET'`.
  String get value {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.head:
        return 'HEAD';
      case HttpMethod.options:
        return 'OPTIONS';
      case HttpMethod.trace:
        return 'TRACE';
      case HttpMethod.connect:
        return 'CONNECT';
    }
  }

  /// Creates an [HttpMethod] from its string representation.
  ///
  /// The [method] parameter should be an uppercase string representing the HTTP method.
  /// If the provided string does not match any known HTTP method, an [ArgumentError] is thrown.
  static HttpMethod fromString(String method) {
    switch (method) {
      case 'GET':
        return HttpMethod.get;
      case 'POST':
        return HttpMethod.post;
      case 'PUT':
        return HttpMethod.put;
      case 'DELETE':
        return HttpMethod.delete;
      case 'PATCH':
        return HttpMethod.patch;
      case 'HEAD':
        return HttpMethod.head;
      case 'OPTIONS':
        return HttpMethod.options;
      case 'TRACE':
        return HttpMethod.trace;
      case 'CONNECT':
        return HttpMethod.connect;
      default:
        throw ArgumentError('Invalid HTTP method: $method');
    }
  }
}
