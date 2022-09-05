import 'package:flutter/services.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

const MethodChannel _channel =
    MethodChannel('flutter_onfido_plus_ios');

/// An implementation of [FlutterOnfidoPlusIosPlatform] that uses method channels.
class FlutterOnfidoPlusIos extends FlutterOnfidoPlusPlatform {
  static void registerWith() {
    FlutterOnfidoPlusPlatform.instance = FlutterOnfidoPlusIos();
  }

  @override
  Future initialize(FlutterOnfidoSettings settings) {
    print(settings.toMap());
    return _channel.invokeMethod(
      'initialize',
      settings.toMap(),
    );
  }
}
