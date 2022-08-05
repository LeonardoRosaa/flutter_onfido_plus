import 'package:equatable/equatable.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

abstract class FlutterOnfidoFaceStep extends Equatable {
  const FlutterOnfidoFaceStep({
    required this.type,
    this.intro = false,
  });

  final bool intro;

  final FlutterOnfidoFaceSteps type;

  Map<String, dynamic> toMap() {
    return {
      'intro': intro,
      'type': type.name,
    };
  }

  @override
  List<Object?> get props => [intro, type];
}

class VideoFaceStep extends FlutterOnfidoFaceStep {
  const VideoFaceStep({
    bool intro = false,
  }): super(
    type: FlutterOnfidoFaceSteps.video,
    intro: intro,
  );
}

class PhotoFaceStep extends FlutterOnfidoFaceStep {
  const PhotoFaceStep({
    bool intro = false,
  }): super(
    type: FlutterOnfidoFaceSteps.photo,
    intro: intro,
  );
}
