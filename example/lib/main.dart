import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example/env.dart';
import 'package:flutter/material.dart';
import 'package:mercado_pago_ducos/mercado_pago_ducos.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MercadoPago mercadoPago;

  @override
  void initState() {
    super.initState();

    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrlBackend,
      ),
    );

    final provider = DioHttpProvider(
      dio: dio,
    );

    final client = HttpClient(provider: provider);

    mercadoPago = MercadoPago(client: client);
  }

  Future<void> createPreference() async {
    final response = await mercadoPago.createPreference(
      body: CreatePreferenceRequestBody(
        items: [
          Item(
            id: '1234',
            title: 'Test',
            quantity: 1,
            unitPrice: 20,
          ),
        ],
        externalReference: 'or-1234',
        metadata: {
          'order_id': 'or-1234',
        },
      ),
    );

    launchUrl(
      Uri.parse(response.initPoint),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> searchPreferences() async {
    final response = await mercadoPago.searchPreferences(
      body: SearchPreferencesRequestBody(),
    );

    log(response.total.toString());
  }

  Future<void> getPreference() async {
    final response = await mercadoPago.getPreference(
      body: GetPreferenceRequestBody(
        id: "2347358770-4398e34b-c80c-4d26-8156-3a0b1d4e7e3e",
      ),
    );

    log(response.id);
  }

  Future<void> updatePreference() async {
    final response = await mercadoPago.updatePreference(
      body: UpdatePreferenceRequestBody(
        id: "2347358770-4398e34b-c80c-4d26-8156-3a0b1d4e7e3e",
        externalReference: 'or-1234-update',
      ),
    );

    log(response.id);
  }

  Future<void> createSubscription() async {
    final response = await mercadoPago.createSubscription(
      body: CreateSubscriptionRequestBody(
        reason: 'Subscription without associated plan',
        autoRecurring: AutoRecurring(
          frequency: 1,
          frequencyType: 'months',
          transactionAmount: 20.5,
          currencyId: 'UYU',
        ),
        payerEmail: 'test_user_1747582417@testuser.com',
        externalReference: 'or-1234',
        backUrl: 'https://www.google.com',
      ),
    );

    launchUrl(
      Uri.parse(response.initPoint),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> searchSubscriptions() async {
    final response = await mercadoPago.searchSubscriptions(
      body: SearchSubscriptionsRequestBody(
        // offset: 50,
        limit: 50,
      ),
    );

    log(response.results.length.toString());
  }

  Future<void> getSubscription() async {
    final response = await mercadoPago.getSubscription(
      body: GetSubscriptionRequestBody(
        id: 'edbf308821c34869a2e38406ff0edcd1',
      ),
    );

    log(response.results.first.toString());
  }

  Future<void> updateSubscription() async {
    final response = await mercadoPago.updateSubscription(
      body: UpdateSubscriptionRequestBody(
        id: '14d8136fcfd64211af49e7c516ef639e',
        status: "authorized",
      ),
    );

    log(response.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text("Run"),
          onPressed: () async {
            /// --- Preferences
            // createPreference();
            // searchPreferences();
            // getPreference();
            // updatePreference();

            /// --- Subscriptions
            // createSubscription();
            // searchSubscriptions();
            // getSubscription();
            // updateSubscription();
          },
        ),
      ),
    );
  }
}
