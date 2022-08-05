import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Flutter Onfido Step', () {

    group('to check the type', () {

      test('is welcome step', () {
        const step = WelcomeStep();

        expect(step.type, FlutterOnfidoSteps.welcome);
      });

      test('is passport step', () {
        const step = PassportConfigurationStep();

        expect(step.type, FlutterOnfidoSteps.passport);
      });

      test('is driving license step', () {
        const step = DrivingLicenseConfigurationStep(
          country: Country.bra,
          format: FlutterOnfidoDocumentFormat.card,
        );

        expect(step.type, FlutterOnfidoSteps.drivingLicense);
      });

      test('is national identity step', () {
        const step = NationalIdentityConfigurationStep(
          country: Country.bra,
          format: FlutterOnfidoDocumentFormat.card,
        );

        expect(step.type, FlutterOnfidoSteps.nationalIdentity);
      });

      test('is residence permit step', () {
        const step = ResidencePermitConfigurationStep(
          country: Country.bra,
        );

        expect(step.type, FlutterOnfidoSteps.residencePermit);
      });

      test('is visa step', () {
        const step = VisaConfigurationStep(
          country: Country.bra,
        );

        expect(step.type, FlutterOnfidoSteps.visa);
      });

      test('is work permit step', () {
        const step = WorkPermitConfigurationStep(
          country: Country.bra,
        );

        expect(step.type, FlutterOnfidoSteps.workPermit);
      });

      test('is generic step', () {
        const step = GenericConfigurationStep(
          country: Country.bra,
        );

        expect(step.type, FlutterOnfidoSteps.generic);
      });
    });
  });
}