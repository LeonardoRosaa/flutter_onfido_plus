import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../flutter_onfido_plus_platform_interfaces.dart';

abstract class FlutterOnfidoPlusPlatform extends PlatformInterface {
  FlutterOnfidoPlusPlatform(): super(token: _token);
  
  static final Object _token = Object();

  static FlutterOnfidoPlusPlatform _instance = MethodChannelFlutterOnfidoPlus();
  
  static FlutterOnfidoPlusPlatform get instance => _instance;

  static set instance(FlutterOnfidoPlusPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future initialize(FlutterOnfidoSettings settings);
}