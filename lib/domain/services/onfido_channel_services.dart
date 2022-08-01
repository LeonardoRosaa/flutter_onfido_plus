import 'package:flutter_onfido_plus/data/gateways/onfido_channel_gateway.dart';
import 'package:flutter_onfido_plus/flutter_onfido_plus.dart';

abstract class OnfidoChannelService {
  Future<OnfidoResult> start(
    OnfidoConfig config, {
    OnfidoIOSAppearance appearance = const OnfidoIOSAppearance(),
  });
}

class OnfidoChannelServiceImpl implements OnfidoChannelService {
  const OnfidoChannelServiceImpl(
      {required this.androidOnfidoGateway,
      required this.iosOnfidoGateway,
      this.isAndroid = false});

  final AndroidOnfidoChannelGateway androidOnfidoGateway;

  final IOSOnfidoChannelGateway iosOnfidoGateway;

  final bool isAndroid;

  @override
  Future<OnfidoResult> start(
    OnfidoConfig config, {
    OnfidoIOSAppearance appearance = const OnfidoIOSAppearance(),
  }) async {
    Map<String, dynamic> onfidoResult;
    if (isAndroid) {
      onfidoResult = await androidOnfidoGateway.start(config);
    } else {
      onfidoResult = await iosOnfidoGateway.start(
        config,
        appearance: appearance,
      );
    }

    return OnfidoResult.fromMap(onfidoResult);
  }
}
