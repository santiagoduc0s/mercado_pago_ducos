/// An abstract class that represents the data contained in an HTTP response.
///
/// Classes implementing [ResponseBody] should provide a constructor that
/// initializes the response data from a JSON map.
abstract class ResponseBody<T> {
  /// Creates an instance of [ResponseBody] from a JSON map.
  ///
  /// The [json] parameter is a [Map<String, dynamic>] containing the JSON
  /// data of the response.
  ResponseBody.fromJson(Map<String, dynamic> json);
}