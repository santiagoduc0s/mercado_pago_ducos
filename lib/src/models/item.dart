class Item {
  /// Item ID.
  final String id;

  /// This is the item`s title, which will display during
  /// the payment process, at checkout, activities, and emails.
  final String title;

  /// Item description.
  final String? description;

  /// Item image URL.
  final String? pictureUrl;

  /// This is a free string where the item category can be added.
  /// We suggest using one of the options shown in the following
  /// link https://api.mercadopago.com/item_categories.
  final String? categoryId;

  /// Item quantity. This property is used to calculate the total cost.
  final int quantity;

  /// Unique ID to identify the currency. ISO_4217 code. Some sites allow
  /// local currency and USD, but it is important to note that the amount
  /// is converted to local currency when the preference is created, as
  /// the checkout always processes transactions using local currency. If
  /// you use USD please take into consideration that this value is not
  /// automatically updated if the value of local currency changes in
  /// relation to USD.
  ///
  /// Examples:
  /// ARS: Argentine peso.
  /// BRL: Brazilian real.
  /// CLP: Chilean peso.
  /// MXN: Mexican peso.
  /// COP: Colombian peso.
  /// PEN: Peruvian sol.
  /// UYU: Uruguayan peso.
  final String? currencyId;

  /// Unit price of the item. This property is used together with the property
  /// quantity to determine the order cost. For Chile (MLC), it must be an integer.
  final double unitPrice;

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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      description: json['description'],
      pictureUrl: json['picture_url'],
      categoryId: json['category_id'],
      currencyId: json['currency_id'],
    );
  }

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
