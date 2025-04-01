/// Represents an item for payment processing.
///
/// This class encapsulates all the details needed for an item that will be
/// processed during the payment process, such as identification, title,
/// quantity, pricing, and other descriptive details.
class Item {
  /// Unique item identifier.
  final String id;

  /// The title of the item, displayed during payment processes, checkout,
  /// and communications such as emails.
  final String title;

  /// A brief description of the item.
  final String? description;

  /// URL of the item's image.
  final String? pictureUrl;

  /// Identifier for the item category.
  ///
  /// This is a free string where the item category can be added.
  /// It is suggested to use one of the options provided by:
  /// https://api.mercadopago.com/item_categories.
  final String? categoryId;

  /// The quantity of the item, used to calculate the total cost.
  final int quantity;

  /// Currency identifier using ISO_4217 code.
  ///
  /// For example:
  /// ARS: Argentine peso.
  /// BRL: Brazilian real.
  /// CLP: Chilean peso.
  /// MXN: Mexican peso.
  /// COP: Colombian peso.
  /// PEN: Peruvian sol.
  /// UYU: Uruguayan peso.
  ///
  /// **Note:** Some platforms allow local currency and USD; however,
  /// the amount is converted to local currency when the preference is created.
  final String? currencyId;

  /// Unit price of the item.
  ///
  /// This value, together with the [quantity], is used to determine the total cost.
  /// For Chile (MLC), it must be an integer.
  final double unitPrice;

  /// Creates an instance of [Item].
  ///
  /// The [id], [title], [quantity], and [unitPrice] parameters are required.
  /// Other parameters are optional.
  Item({
    required this.id,
    required this.title,
    required this.quantity,
    required this.unitPrice,
    this.description,
    this.pictureUrl,
    this.categoryId,
    this.currencyId,
  });

  /// Creates an [Item] instance from a JSON map.
  ///
  /// The JSON map should include keys corresponding to the item properties:
  /// - 'id': unique identifier,
  /// - 'title': item title,
  /// - 'quantity': number of items,
  /// - 'unit_price': unit price (will be converted to double),
  /// - 'description': item description,
  /// - 'picture_url': URL of the item image,
  /// - 'category_id': category identifier,
  /// - 'currency_id': currency identifier.
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      // Ensure the unit price is a double even if it comes as num.
      unitPrice: (json['unit_price'] as num).toDouble(),
      description: json['description'],
      pictureUrl: json['picture_url'],
      categoryId: json['category_id'],
      currencyId: json['currency_id'],
    );
  }

  /// Converts the [Item] instance into a JSON map.
  ///
  /// The resulting map includes all item properties with their respective keys.
  /// Any key with a `null` value is removed from the map to keep the JSON clean.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "quantity": quantity,
      "unit_price": unitPrice,
      "description": description,
      "picture_url": pictureUrl,
      "category_id": categoryId,
      "currency_id": currencyId,
    }..removeWhere((key, value) => value == null);
  }
}
