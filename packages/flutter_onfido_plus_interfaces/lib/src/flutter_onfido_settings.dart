import 'package:equatable/equatable.dart';

import 'package:flutter_onfido_plus_interfaces/flutter_onfido_plus_interfaces.dart';

class FlutterOnfidoSettings extends Equatable {
  const FlutterOnfidoSettings({
    required this.token,
    required this.steps,
    this.faceStep,
  });

  final String token;

  final List<FlutterOnfidoStep> steps;

  final FlutterOnfidoFaceStep? faceStep;

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
