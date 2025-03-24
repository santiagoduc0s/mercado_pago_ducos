import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open WebView Bottom Sheet"),
          onPressed: () {
            launchUrl(
              Uri.parse(
                'https://sandbox.mercadopago.com.uy/checkout/v1/redirect?pref_id=2347358770-250fcb36-c15f-4dc6-aedc-487fedf55f32',
              ),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      ),
    );
  }
}
