/// Summary information on subscription invoices and charges.
///
/// This class provides a detailed summary of the subscription's
/// invoicing and collection status, including quotas, amounts charged,
/// pending collections, and the overall collection status.
class Summarized {
  /// Total number of payments (quotas) that will be made.
  final int? quotas;

  /// Total number of quotas that have been charged.
  final int? chargedQuantity;

  /// Total amount collected to date.
  final num? chargedAmount;

  /// Number of quotas pending to be charged.
  final int? pendingChargeQuantity;

  /// Amount pending collection.
  final num? pendingChargeAmount;

  /// Date of the last charge (represented as a timestamp).
  final String? lastChargedDate;

  /// Amount charged in the last transaction.
  final num? lastChargedAmount;

  /// Numeric summary of the collection status.
  ///
  /// Represents the subscription's collection status:
  /// - green: All collections made.
  /// - yellow: Collection issues (attempting to collect an invoice).
  /// - red: Pending collections (an invoice could not be collected).
  /// - blank: Discounted collection.
  final String? semaphore;

  /// Creates an instance of [Summarized] with the provided summary details.
  Summarized({
    this.quotas,
    this.chargedQuantity,
    this.chargedAmount,
    this.pendingChargeQuantity,
    this.pendingChargeAmount,
    this.lastChargedDate,
    this.lastChargedAmount,
    this.semaphore,
  });

  /// Creates an instance of [Summarized] from a JSON map.
  ///
  /// The JSON map should contain keys corresponding to each property:
  /// - 'quotas': Total number of quotas.
  /// - 'charged_quantity': Total charged quotas.
  /// - 'charged_amount': Total amount collected.
  /// - 'pending_charge_quantity': Number of quotas pending charge.
  /// - 'pending_charge_amount': Amount pending collection.
  /// - 'last_charged_date': Date of the last charge.
  /// - 'last_charged_amount': Amount charged in the last transaction.
  /// - 'semaphore': Numeric status of the collection.
  factory Summarized.fromJson(Map<String, dynamic> json) {
    return Summarized(
      quotas: json['quotas'],
      chargedQuantity: json['charged_quantity'],
      chargedAmount: json['charged_amount'],
      pendingChargeQuantity: json['pending_charge_quantity'],
      pendingChargeAmount: json['pending_charge_amount'],
      lastChargedDate: json['last_charged_date'],
      lastChargedAmount: json['last_charged_amount'],
      semaphore: json['semaphore'],
    );
  }
}
