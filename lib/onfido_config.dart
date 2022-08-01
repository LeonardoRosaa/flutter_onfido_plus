import 'dart:convert';

import 'core/faults/faults.dart';
import 'core/patterns/patterns.dart';
import 'enums.dart';


class OnfidoConfig {
  final String sdkToken;
  final OnfidoFlowSteps flowSteps;
  final String? locale;

  OnfidoConfig({
    required this.sdkToken,
    required this.flowSteps,
    this.locale,
  }) {
    if (sdkToken.isEmpty) {
      throw OnfidoConfigMissingTokenException();
    }

    if (!Patterns.isValidJWT(sdkToken)) {
      throw OnfidoConfigInvalidJWTTokenException();
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sdkToken': sdkToken,
      'flowSteps': flowSteps.toMap(),
      'locale': locale,
    };
  }

  factory OnfidoConfig.fromMap(Map<String, dynamic> map) {
    return OnfidoConfig(
      sdkToken: map['sdkToken'] as String,
      flowSteps: OnfidoFlowSteps.fromMap(map['flowSteps'] as Map<String,dynamic>),
      locale: map['locale'] != null ? map['locale'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoConfig.fromJson(String source) => OnfidoConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoFlowSteps {
  final bool? welcome;
  final OnfidoCaptureDocumentStep captureDocument;
  final OnfidoCaptureFaceStep? captureFace;

  OnfidoFlowSteps({
    this.welcome,
    required this.captureDocument,
    this.captureFace,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'welcome': welcome,
      'captureDocument': captureDocument.toMap(),
      'captureFace': captureFace?.toMap(),
    };
  }

  factory OnfidoFlowSteps.fromMap(Map<String, dynamic> map) {
    return OnfidoFlowSteps(
      welcome: map['welcome'] != null ? map['welcome'] as bool : null,
      captureDocument: OnfidoCaptureDocumentStep.fromMap(map['captureDocument'] as Map<String,dynamic>),
      captureFace: map['captureFace'] != null ? OnfidoCaptureFaceStep.fromMap(map['captureFace'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoFlowSteps.fromJson(String source) => OnfidoFlowSteps.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoCaptureDocumentStep {
  final OnfidoDocumentType? docType;
  final OnfidoCountryCode? countryCode;

  OnfidoCaptureDocumentStep({
    required this.docType,
    required this.countryCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docType': docType?.name,
      'countryCode': countryCode?.name,
    };
  }

  factory OnfidoCaptureDocumentStep.fromMap(Map<String, dynamic> map) {
    return OnfidoCaptureDocumentStep(
      docType: map['docType'] != null ? OnfidoDocumentType.values.byName(map['docType']) : null,
      countryCode: map['countryCode'] != null ? OnfidoCountryCode.values.byName(map['countryCode']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoCaptureDocumentStep.fromJson(String source) => OnfidoCaptureDocumentStep.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoCaptureFaceStep {
  final OnfidoCaptureType? type;

  OnfidoCaptureFaceStep(this.type);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type?.name,
    };
  }

  factory OnfidoCaptureFaceStep.fromMap(Map<String, dynamic> map) {
    return OnfidoCaptureFaceStep(
      map['type'] != null ? OnfidoCaptureType.values.byName(map['type']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoCaptureFaceStep.fromJson(String source) => OnfidoCaptureFaceStep.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoIOSAppearance {
  final String? onfidoPrimaryColor;
  final String? onfidoPrimaryButtonTextColor;
  final String? onfidoPrimaryButtonColorPressed;
  final bool? onfidoIosSupportDarkMode;

  const OnfidoIOSAppearance({
    this.onfidoPrimaryButtonTextColor,
    this.onfidoPrimaryButtonColorPressed,
    this.onfidoIosSupportDarkMode = false,
    this.onfidoPrimaryColor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'onfidoPrimaryColor': onfidoPrimaryColor,
      'onfidoPrimaryButtonTextColor': onfidoPrimaryButtonTextColor,
      'onfidoPrimaryButtonColorPressed': onfidoPrimaryButtonColorPressed,
      'onfidoIosSupportDarkMode': onfidoIosSupportDarkMode,
    };
  }

  factory OnfidoIOSAppearance.fromMap(Map<String, dynamic> map) {
    return OnfidoIOSAppearance(
      onfidoPrimaryColor: map['onfidoPrimaryColor'] != null ? map['onfidoPrimaryColor'] as String : null,
      onfidoPrimaryButtonTextColor: map['onfidoPrimaryButtonTextColor'] != null ? map['onfidoPrimaryButtonTextColor'] as String : null,
      onfidoPrimaryButtonColorPressed: map['onfidoPrimaryButtonColorPressed'] != null ? map['onfidoPrimaryButtonColorPressed'] as String : null,
      onfidoIosSupportDarkMode: map['onfidoIosSupportDarkMode'] != null ? map['onfidoIosSupportDarkMode'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoIOSAppearance.fromJson(String source) => OnfidoIOSAppearance.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoResult {
  final OnfidoDocumentResult? document;
  final OnfidoFaceResult? face;

  OnfidoResult({
    this.document,
    this.face,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document?.toMap(),
      'face': face?.toMap(),
    };
  }

  factory OnfidoResult.fromMap(Map<String, dynamic> map) {
    return OnfidoResult(
      document: map['document'] != null ? OnfidoDocumentResult.fromMap(map['document'] as Map<String,dynamic>) : null,
      face: map['face'] != null ? OnfidoFaceResult.fromMap(map['face'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoResult.fromJson(String source) => OnfidoResult.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoFaceResult {
  final String? id;
  final OnfidoCaptureType? variant;

  OnfidoFaceResult({this.id, this.variant});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'variant': variant?.name,
    };
  }

  factory OnfidoFaceResult.fromMap(Map<String, dynamic> map) {
    return OnfidoFaceResult(
      id: map['id'] != null ? map['id'] as String : null,
      variant: map['variant'] != null ? OnfidoCaptureType.values.byName(map['variant']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoFaceResult.fromJson(String source) => OnfidoFaceResult.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoDocumentResult {
  final OnfidoDocumentResultDetail? front;
  final OnfidoDocumentResultDetail? back;

  OnfidoDocumentResult({this.front, this.back});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'front': front?.toMap(),
      'back': back?.toMap(),
    };
  }

  factory OnfidoDocumentResult.fromMap(Map<String, dynamic> map) {
    return OnfidoDocumentResult(
      front: map['front'] != null ? OnfidoDocumentResultDetail.fromMap(map['front'] as Map<String,dynamic>) : null,
      back: map['back'] != null ? OnfidoDocumentResultDetail.fromMap(map['back'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoDocumentResult.fromJson(String source) => OnfidoDocumentResult.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OnfidoDocumentResultDetail {
  final String? id;

  OnfidoDocumentResultDetail(this.id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory OnfidoDocumentResultDetail.fromMap(Map<String, dynamic> map) {
    return OnfidoDocumentResultDetail(
      map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnfidoDocumentResultDetail.fromJson(String source) => OnfidoDocumentResultDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
