import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onfido_plus_platform_interfaces/flutter_onfido_plus_platform_interfaces.dart';
class FlutterOnfidoAppearence extends Equatable {
  
  const FlutterOnfidoAppearence({
    required this.primaryColor,
    required this.primaryTitleColor,
    required this.primaryBackgroundPressedColor,
    required this.secondaryBackgroundPressedColor,
    required this.supportDarkMode,
    this.secondaryTitleColor,
    this.buttonCornerRadius,
    this.fontRegular,
    this.fontBold,
  });

  final Color primaryColor;

  final Color primaryTitleColor;

  final Color? secondaryTitleColor;

  final Color primaryBackgroundPressedColor;

  final Color secondaryBackgroundPressedColor;

  final double? buttonCornerRadius;

  final String? fontRegular;

  final String? fontBold;

  final bool supportDarkMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primaryColor': primaryColor.toMap(),
      'primaryTitleColor': primaryTitleColor.toMap(),
      'secondaryTitleColor': secondaryTitleColor?.toMap(),
      'primaryBackgroundPressedColor': primaryBackgroundPressedColor.toMap(),
      'secondaryBackgroundPressedColor': secondaryBackgroundPressedColor.toMap(),
      'buttonCornerRadius': buttonCornerRadius,
      'fontRegular': fontRegular,
      'fontBold': fontBold,
      'supportDarkMode': supportDarkMode,
    };
  }

  @override
  List<Object?> get props =>  [
      primaryColor,
      primaryTitleColor,
      primaryBackgroundPressedColor,
      secondaryBackgroundPressedColor,
      buttonCornerRadius,
      fontRegular,
      fontBold,
      supportDarkMode,
    ];
}
