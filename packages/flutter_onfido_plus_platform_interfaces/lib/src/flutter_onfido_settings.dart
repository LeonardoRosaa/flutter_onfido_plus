import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

class FlutterOnfidoSettings extends Equatable {
  const FlutterOnfidoSettings({
    required this.token,
    required this.steps,
    this.faceStep,
    this.appearence,
  });

  /// The token is necessary to initialize the SDK. 
  final String token;

  final List<FlutterOnfidoStep> steps;

  final FlutterOnfidoFaceStep? faceStep;

  /// The appearance field works just for IOS platform, therefore, 
  /// Android platform needs to check out the official documentation: 
  /// https://documentation.onfido.com/sdk/android/#ui-customization
  final FlutterOnfidoAppearence? appearence;

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'steps': steps.map((x) => x.toMap()).toList(),
      'faceStep': faceStep?.toMap(),
      'appearence': appearence?.toMap(),
    };
  }

  @override
  List<Object?> get props => [
        token,
        steps,
        faceStep,
      ];
}
