import 'package:flutter/widgets.dart';

extension ColorExtension on Color {
  
  Map<String, int> toMap() {
    return {
      'red': red,
      'green': green,
      'blue': blue,
      'alpha': alpha,
    };
  }
}