import 'package:mercado_pago_flowlabs/src/models/models.dart'
    show FreeMethod, ReceiverAddress;

class Shipments {
  /// Shipment mode.
  /// custom: Custom shipping. Not available for Checkout Pro or Payment link.
  /// me2: Mercado Envíos.
  /// not_specified: Shipping mode not specified.
  final String? mode;

  /// The payer has the option to pick up the shipment in your store (mode:me2 only).
  final bool? localPickup;

  /// Dimensions of the shipment in cm x cm x cm, gr (mode:me2 only).
  /// Example: "32 x 25 x 16"
  final String? dimensions;

  /// Select default shipping method in checkout (mode:me2 only).
  final int? defaultShippingMethod;

  /// Offer a shipping method as free shipping (mode:me2 only).
  final List<FreeMethod>? freeMethods;

  /// Shipment cost (mode:custom only).
  /// Example: 20.0
  final double? cost;

  /// Free shipping for mode:custom.
  final bool? freeShipping;

  /// Shipping address.
  final ReceiverAddress? receiverAddress;

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
