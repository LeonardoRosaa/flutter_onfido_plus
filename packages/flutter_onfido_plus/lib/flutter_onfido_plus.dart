export 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

initialize(FlutterOnfidoSettings settings) async {
  FlutterOnfidoPlusPlatform.instance.initialize(settings);
}
