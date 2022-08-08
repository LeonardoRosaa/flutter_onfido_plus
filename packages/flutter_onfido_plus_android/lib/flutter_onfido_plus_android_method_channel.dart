import 'package:flutter/services.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

const MethodChannel _channel =
    MethodChannel('flutter_onfido_plus_android');

/// An implementation of [FlutterOnfidoPlusAndroidPlatform] that uses method channels.
class FlutterOnfidoPlusAndroid extends FlutterOnfidoPlusPlatform {
  static void registerWith() {
    FlutterOnfidoPlusPlatform.instance = FlutterOnfidoPlusAndroid();
  }

  @override
  Future initialize(FlutterOnfidoSettings settings) {
    return _channel.invokeMethod(
      'initialize',
      settings.toMap(),
    );
  }
}
