
/// Contains pagination details for the search results.
class Paging {
  /// The offset of the first item in the collection to return.
  final int offset;

  /// The maximum number of entries to return.
  final int limit;

  /// The total number of items in the collection.
  final int total;

  Paging({
    required this.offset,
    required this.limit,
    required this.total,
  });

  /// Creates an instance from a JSON object.
  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
    );
  }
}