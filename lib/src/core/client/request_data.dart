/// An abstract class that represents the body of an HTTP request.
///
/// Classes implementing [RequestBody] should override [toJson] to convert
/// their contents into a JSON map suitable for sending in an HTTP request.
abstract class RequestBody {
  /// Converts this request body into a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representing the JSON structure
  /// of the request body.
  Map<String, dynamic> toJson();
}