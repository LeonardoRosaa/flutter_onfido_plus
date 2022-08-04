import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class FlutterOnfidoAppearence extends Equatable {
  
  const FlutterOnfidoAppearence({
    this.primaryColor,
    this.primaryTitleColor,
    this.primaryBackgroundPressedColor,
    this.secondaryBackgroundPressedColor,
    this.borderCornerRadius,
    this.fontRegular,
    this.fontBold,
    this.supportDarkMode,
  });

  final Color? primaryColor;

  final Color? primaryTitleColor;

  final Color? primaryBackgroundPressedColor;

  final Color? secondaryBackgroundPressedColor;

  final int? borderCornerRadius;

  final String? fontRegular;

  final String? fontBold;

  final bool? supportDarkMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primaryColor': primaryColor?.value,
      'primaryTitleColor': primaryTitleColor?.value,
      'primaryBackgroundPressedColor': primaryBackgroundPressedColor?.value,
      'secondaryBackgroundPressedColor': secondaryBackgroundPressedColor?.value,
      'borderCornerRadius': borderCornerRadius,
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
      borderCornerRadius,
      fontRegular,
      fontBold,
      supportDarkMode,
    ];
}
