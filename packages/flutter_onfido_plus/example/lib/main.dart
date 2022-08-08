import 'package:flutter/material.dart';

import 'package:flutter_onfido_plus/flutter_onfido_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  onInitialize() {
    const settings = FlutterOnfidoSettings(
      token: 'Token',
      steps: [
        WelcomeStep(),
      ],
    );
    initialize(settings);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Onfido Plugin Plus example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: onInitialize,
            child: const Text('initialize'),
          ),
        ),
      ),
    );
  }
}
