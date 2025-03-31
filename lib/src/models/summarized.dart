/// Summary information on subscription invoices and charges.
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

  /// Date of the last charge (as a timestamp).
  final String? lastChargedDate;

  /// Amount charged in the last transaction.
  final num? lastChargedAmount;

  /// Numeric summary of the collection status.
  ///
  /// Subscription collection status summary.
  /// green: All collections made.
  /// yellow: With collection problems. We are trying to collect an invoice.
  /// red: With pending collections. An invoice could not be collected.
  /// blank: Discounted collection.
  final String? semaphore;

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

  /// Creates an instance from a JSON object.
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
