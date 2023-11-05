import 'package:flutter/widgets.dart';
import 'package:nd_utils/nd_absolute_dimention_design/internals/internals.dart';

class NDAbsoluteDimentionDesign {
  /// The logical pixels per inch
  final double ppi;

  final double scale;

  NDAbsoluteDimentionDesign({
    required this.ppi,
  }) : scale = ppi / defaultPpi;

  static NDAbsoluteDimentionDesign by({
    required Size point,
    required Size physical,
  }) =>
      NDAbsoluteDimentionDesign(ppi: point.height / physical.height);

  static Future<void> ensureInitialized() async {
    await initializeDefaultPpi();
  }

  static Widget build(
    BuildContext context,
    WidgetBuilder builder, {
    NDAbsoluteDimentionDesign? design,
  }) {
    final NDAbsoluteDimentionDesign? oldDesign = _design;
    try {
      if (design != null) {
        _design = design;
      }

      return builder(context);
    } finally {
      _design = oldDesign;
    }
  }

  static double setValue(num value) {
    final scale = _design?.scale;
    if (scale == null) {
      return value.toDouble();
    }

    return value * scale;
  }

  // Privates
  static NDAbsoluteDimentionDesign? _design;
}
