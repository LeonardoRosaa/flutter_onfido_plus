import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onfido_plus/flutter_onfido_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> init() async {
    try {
      final result = await FlutterOnfidoPlus.start(
        config: OnfidoConfig(
          sdkToken:
              // PROVIDE SDK TOKEN YOU'VE GOT FROM YOUR BACKEND
              "token.expired-example",
          flowSteps: OnfidoFlowSteps(
            welcome: false,
            captureDocument: OnfidoCaptureDocumentStep(
              countryCode: OnfidoCountryCode.ARG,
              docType: OnfidoDocumentType.GENERIC,
            ),
            // captureFace: OnfidoCaptureFaceStep(OnfidoCaptureType.PHOTO),
          ),
        ),
        iosAppearance: OnfidoIOSAppearance(),
      );
      print('R\ne\ns\nu\nl\nt->\n');
      print(result);
      print(result.toJson());
      // ASK YOUR BACKEND IF USER HAS PASSED VERIFICATION
    } catch (e) {
      print('ERROR e =\n');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                onPressed: init,
                child: Text('start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
