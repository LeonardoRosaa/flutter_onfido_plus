import 'package:equatable/equatable.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';

abstract class FlutterOnfidoStep extends Equatable {
  const FlutterOnfidoStep({
    required this.type,
  });

  final FlutterOnfidoSteps type;

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
    };
  }

  @override
  List<Object?> get props => [type];
}

abstract class FlutterOnfidoWithCountryStep extends FlutterOnfidoStep {
  const FlutterOnfidoWithCountryStep({
    required this.country,
    required super.type,
  });

  final Country country;

  @override
  Map<String, dynamic> toMap() {
    return {
      'country': country.name,
      'type': type.name,
    };
  }

  @override
  List<Object?> get props => [country, type];
}

abstract class FlutterOnfidoWithCountryAndDocumentStep
    extends FlutterOnfidoStep {
  const FlutterOnfidoWithCountryAndDocumentStep({
    required this.country,
    required this.format,
    required super.type,
  });

  final Country country;

  final FlutterOnfidoDocumentFormat format;

  @override
  Map<String, dynamic> toMap() {
    return {
      'country': country.name,
      'format': format.name,
      'type': type.name,
    };
  }

  @override
  List<Object?> get props => [country, format, type];
}

class WelcomeStep extends FlutterOnfidoStep {
  const WelcomeStep()
      : super(
          type: FlutterOnfidoSteps.welcome,
        );
}

class PassportConfigurationStep extends FlutterOnfidoStep {
  const PassportConfigurationStep()
      : super(
          type: FlutterOnfidoSteps.passport,
        );
}

class DrivingLicenseConfigurationStep
    extends FlutterOnfidoWithCountryAndDocumentStep {
  const DrivingLicenseConfigurationStep({
    required Country country,
    required FlutterOnfidoDocumentFormat format,
  }) : super(
          country: country,
          format: format,
          type: FlutterOnfidoSteps.drivingLicense,
        );
}

class NationalIdentityConfigurationStep
    extends FlutterOnfidoWithCountryAndDocumentStep {
  const NationalIdentityConfigurationStep({
    required Country country,
    required FlutterOnfidoDocumentFormat format,
  }) : super(
          country: country,
          format: format,
          type: FlutterOnfidoSteps.nationalIdentity,
        );
}

class ResidencePermitConfigurationStep extends FlutterOnfidoWithCountryStep {
  const ResidencePermitConfigurationStep({
    required Country country,
  }) : super(
          country: country,
          type: FlutterOnfidoSteps.residencePermit,
        );
}

class VisaConfigurationStep extends FlutterOnfidoWithCountryStep {
  const VisaConfigurationStep({
    required Country country,
  }) : super(
          country: country,
          type: FlutterOnfidoSteps.visa,
        );
}

class WorkPermitConfigurationStep extends FlutterOnfidoWithCountryStep {
  const WorkPermitConfigurationStep({
    required Country country,
  }) : super(
          country: country,
          type: FlutterOnfidoSteps.workPermit,
        );
}

class GenericConfigurationStep extends FlutterOnfidoWithCountryStep {
  const GenericConfigurationStep({
    required Country country,
  }) : super(
          country: country,
          type: FlutterOnfidoSteps.generic,
        );
}
