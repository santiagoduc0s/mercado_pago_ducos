/// Contains pagination details for the search results.
///
/// This class encapsulates the necessary information for handling pagination,
/// such as the current offset, the limit of items per page, and the total number of items.
class Paging {
  /// The offset of the first item in the collection to return.
  final int offset;

  /// The maximum number of entries to return.
  final int limit;

  /// The total number of items in the collection.
  final int total;

  /// Creates an instance of [Paging] with the given [offset], [limit], and [total].
  Paging({
    required this.offset,
    required this.limit,
    required this.total,
  });

  /// Creates an instance of [Paging] from a JSON object.
  ///
  /// The JSON object should contain:
  /// - 'offset': starting position of the returned items,
  /// - 'limit': maximum number of items to return,
  /// - 'total': total number of items in the collection.
  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
    );
  }
}
