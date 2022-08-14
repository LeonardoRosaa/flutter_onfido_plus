import 'package:flutter/material.dart';

import 'package:flutter_onfido_plus_ios/flutter_onfido_plus_ios.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

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
    FlutterOnfidoPlusIos channel = FlutterOnfidoPlusIos();
    const settings = FlutterOnfidoSettings(
      token: 'Token',
      steps: [
        WelcomeStep(),
        ResidencePermitConfigurationStep(
          country: Country.bra,
        ),
        DrivingLicenseConfigurationStep(
          country: Country.egy,
          format: FlutterOnfidoDocumentFormat.card
        ),
      ],
      faceStep: VideoFaceStep(intro: true)
    );
    channel.initialize(settings);
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
