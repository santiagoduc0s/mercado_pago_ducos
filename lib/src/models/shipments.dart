import 'package:mercado_pago_ducos/src/models/models.dart'
    show FreeMethod, ReceiverAddress;

/// Represents shipment details in a payment transaction.
///
/// This class contains configuration information for shipping, such as mode,
/// pickup options, dimensions, cost, free shipping, and receiver address.
class Shipments {
  /// Shipment mode.
  ///
  /// Possible values:
  /// - `custom`: Custom shipping (Not available for Checkout Pro or Payment link).
  /// - `me2`: Mercado Envíos.
  /// - `not_specified`: Shipping mode not specified.
  final String? mode;

  /// Indicates if the payer has the option to pick up the shipment locally (mode: me2 only).
  final bool? localPickup;

  /// Dimensions of the shipment in "cm x cm x cm, gr" (mode: me2 only).
  /// Example: "32 x 25 x 16"
  final String? dimensions;

  /// Selects the default shipping method in checkout (mode: me2 only).
  final int? defaultShippingMethod;

  /// List of free shipping methods offered (mode: me2 only).
  final List<FreeMethod>? freeMethods;

  /// Shipment cost (used in mode: custom only).
  /// Example: 20.0
  final double? cost;

  /// Indicates if free shipping is available (used in mode: custom only).
  final bool? freeShipping;

  /// Shipping address details.
  final ReceiverAddress? receiverAddress;

  /// Creates an instance of [Shipments] with the provided shipping configuration.
  Shipments({
    this.mode,
    this.localPickup,
    this.dimensions,
    this.defaultShippingMethod,
    this.freeMethods,
    this.cost,
    this.freeShipping,
    this.receiverAddress,
  });

  /// Creates a [Shipments] instance from a JSON map.
  ///
  /// The JSON map should include keys corresponding to the shipment properties.
  factory Shipments.fromJson(Map<String, dynamic> json) {
    return Shipments(
      mode: json['mode'],
      localPickup: json['local_pickup'],
      dimensions: json['dimensions'],
      defaultShippingMethod: json['default_shipping_method'],
      freeMethods: json['free_methods'] != null
          ? (json['free_methods'] as List)
              .map((e) => FreeMethod.fromJson(e))
              .toList()
          : null,
      cost: json['cost'] != null ? (json['cost'] as num).toDouble() : null,
      freeShipping: json['free_shipping'],
      receiverAddress: json['receiver_address'] != null
          ? ReceiverAddress.fromJson(json['receiver_address'])
          : null,
    );
  }

  /// Converts the [Shipments] instance into a JSON map.
  ///
  /// This method serializes all non-null properties. Note that non-null
  /// assertions are used for [freeMethods] and [receiverAddress] to call their
  /// respective `toJson()` methods. Ensure these properties are not null when
  /// calling this method.
  Map<String, dynamic> toJson() {
    return {
      "mode": mode,
      "local_pickup": localPickup,
      "dimensions": dimensions,
      "default_shipping_method": defaultShippingMethod,
      "free_methods": freeMethods!.map((e) => e.toJson()).toList(),
      "cost": cost,
      "free_shipping": freeShipping,
      "receiver_address": receiverAddress!.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
