import 'package:flutter_onfido_plus_interfaces/flutter_onfido_plus_interfaces.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Flutter Onfido Face Step', () {

    group('to check the type', () {

      test('is video step', () {
        const step = VideoFaceStep();

        expect(step.type, FlutterOnfidoFaceSteps.video);
      });

      test('is photo step', () {
         const step = PhotoFaceStep();

        expect(step.type, FlutterOnfidoFaceSteps.photo);
      });
    });
  });
}