import 'package:mercado_pago_ducos/mercado_pago_ducos.dart';

/// Main entry point for interacting with the Mercado Pago API.
///
/// The [MercadoPago] class provides high-level methods to create, search,
/// retrieve, and update both preferences and subscriptions. It wraps around
/// dedicated repositories for each domain.
class MercadoPago {
  /// Creates an instance of [MercadoPago] with the provided [client].
  ///
  /// The constructor initializes two repositories:
  /// - [repoPreference] for handling payment preference related operations.
  /// - [repoSubscription] for handling subscription related operations.
  MercadoPago({required this.client})
      : repoPreference = PreferenceRepository(
          datasource: PreferenceApiDatasource(client: client),
        ),
        repoSubscription = SubscriptionRepository(
          datasource: SubscriptionApiDatasource(client: client),
        );

  /// The HTTP client used to communicate with the Mercado Pago API.
  final HttpClient client;

  /// Repository for handling payment preferences.
  final PreferenceRepository repoPreference;

  /// Repository for handling subscriptions.
  final SubscriptionRepository repoSubscription;

  /// Creates a new payment preference.
  ///
  /// Takes a [CreatePreferenceRequestBody] containing the necessary
  /// details and returns a [Future] with the [CreatePreferenceResponseBody].
  Future<CreatePreferenceResponseBody> createPreference({
    required CreatePreferenceRequestBody body,
  }) {
    return repoPreference.createPreference(body);
  }

  /// Searches for payment preferences based on the given criteria.
  ///
  /// Takes a [SearchPreferencesRequestBody] with filter parameters and
  /// returns a [Future] with the [SearchPreferencesResponseBody].
  Future<SearchPreferencesResponseBody> searchPreferences({
    required SearchPreferencesRequestBody body,
  }) {
    return repoPreference.searchPreferences(body);
  }

  /// Retrieves a specific payment preference.
  ///
  /// Requires a [GetPreferenceRequestBody] with necessary identifying details,
  /// and returns a [Future] with the [GetPreferenceResponseBody].
  Future<GetPreferenceResponseBody> getPreference({
    required GetPreferenceRequestBody body,
  }) {
    return repoPreference.getPreference(body);
  }

  /// Updates an existing payment preference.
  ///
  /// Takes a [UpdatePreferenceRequestBody] with the updated information
  /// and returns a [Future] with the [UpdatePreferenceResponseBody].
  Future<UpdatePreferenceResponseBody> updatePreference({
    required UpdatePreferenceRequestBody body,
  }) {
    return repoPreference.updatePreference(body);
  }

  /// Creates a new subscription.
  ///
  /// Takes a [CreateSubscriptionRequestBody] with the subscription details
  /// and returns a [Future] with the [CreateSubscriptionResponseBody].
  Future<CreateSubscriptionResponseBody> createSubscription({
    required CreateSubscriptionRequestBody body,
  }) {
    return repoSubscription.createSubscription(body);
  }

  /// Searches for subscriptions based on the provided filters.
  ///
  /// Requires a [SearchSubscriptionsRequestBody] and returns a [Future] with
  /// the [SearchSubscriptionsResponseBody].
  Future<SearchSubscriptionsResponseBody> searchSubscriptions({
    required SearchSubscriptionsRequestBody body,
  }) {
    return repoSubscription.searchSubscriptions(body);
  }

  /// Retrieves details of a specific subscription.
  ///
  /// Takes a [GetSubscriptionRequestBody] to identify the subscription and
  /// returns a [Future] with the [GetSubscriptionResponseBody].
  Future<GetSubscriptionResponseBody> getSubscription({
    required GetSubscriptionRequestBody body,
  }) {
    return repoSubscription.getSubscription(body);
  }

  /// Updates an existing subscription.
  ///
  /// Takes a [UpdateSubscriptionRequestBody] with updated data and returns a
  /// [Future] with the [UpdateSubscriptionResponseBody].
  Future<UpdateSubscriptionResponseBody> updateSubscription({
    required UpdateSubscriptionRequestBody body,
  }) {
    return repoSubscription.updateSubscription(body);
  }
}
