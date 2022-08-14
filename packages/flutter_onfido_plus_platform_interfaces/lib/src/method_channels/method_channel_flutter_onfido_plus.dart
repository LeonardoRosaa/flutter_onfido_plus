import 'package:flutter/services.dart';
import 'package:flutter_onfido_plus_platform_interfaces/src/flutter_onfido_plus_platform.dart';
import 'package:flutter_onfido_plus_platform_interfaces/src/flutter_onfido_settings.dart';

const MethodChannel _channel = MethodChannel('plugins/flutter_onfido_plus');

class MethodChannelFlutterOnfidoPlus extends FlutterOnfidoPlusPlatform {
  
  @override
  Future initialize(FlutterOnfidoSettings settings) {
    return _channel.invokeMethod(
      'initialize',
      settings.toJson(),
    );
  }
}
