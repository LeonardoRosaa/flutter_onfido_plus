import 'package:equatable/equatable.dart';

import 'package:flutter_onfido_plus_interfaces/flutter_onfido_plus_interfaces.dart';
import 'package:flutter_onfido_plus_interfaces/src/flutter_onfido_appearence.dart';

class FlutterOnfidoSettings extends Equatable {
  const FlutterOnfidoSettings({
    required this.token,
    required this.steps,
    this.faceStep,
    this.appearence,
  });

  final String token;

  final List<FlutterOnfidoStep> steps;

  final FlutterOnfidoFaceStep? faceStep;

  /// The appearance field works just for IOS platform, therefore, 
  /// Android platform needs to read the official documentation: 
  /// https://documentation.onfido.com/sdk/android/#ui-customization
  final FlutterOnfidoAppearence? appearence;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'steps': steps.map((x) => x.toMap()).toList(),
      'faceStep': faceStep?.toMap(),
    };
  }

  @override
  List<Object?> get props => [
        token,
        steps,
        faceStep,
      ];
}
