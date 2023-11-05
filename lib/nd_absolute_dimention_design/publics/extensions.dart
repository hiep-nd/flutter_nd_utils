import 'package:flutter/widgets.dart';
import 'package:nd_utils/nd_absolute_dimention_design/publics/nd_absolute_dimention_design.dart';
import 'package:nd_utils/nd_absolute_dimention_design/internals/design.dart'
    as internals;

extension NDAbsoluteDimentionNum on num {
  double get r => NDAbsoluteDimentionDesign.setValue(this);
  double get ndR => r;
}

extension NDAbsoluteDimentionEdgeInsets on EdgeInsets {
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get ndR => r;
}

extension NDAbsoluteDimentionBorderRadius on BorderRadius {
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );

  BorderRadius get ndR => r;
}

extension NDAbsoluteDimentionRadius on Radius {
  Radius get r => Radius.elliptical(x.r, y.r);
  Radius get ndR => r;
}

extension NDAbsoluteDimentionBoxConstraints on BoxConstraints {
  BoxConstraints get r => copyWith(
        maxHeight: maxHeight.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        minWidth: minWidth.r,
      );

  BoxConstraints get ndR => r;
}

extension NDMediaQueryDataUtils on MediaQueryData {
  /// The logical pixels per inch (by OS). Not work with external display.
  double get defaultPpi {
    return internals.defaultPpi;
  }

  /// The alias of defaultPpi
  double get ndDefaultPpi => defaultPpi;
}

extension NDSizedBoxUtils on SizedBox {
  SizedBox get r => SizedBox(
        key: key,
        width: width?.r,
        height: height?.r,
        child: child,
      );

  /// The alias of r
  SizedBox get ndR => r;
}
