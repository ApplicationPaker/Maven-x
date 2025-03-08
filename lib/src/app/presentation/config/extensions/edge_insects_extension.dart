import 'package:flutter/material.dart';

extension EdgeInsectsExtension on num {

  EdgeInsetsGeometry get allEdge {
    return EdgeInsets.all(toDouble()) ;
  }

  EdgeInsetsGeometry get horizontalEdge {
    return EdgeInsets.symmetric(horizontal: toDouble()) ;
  }

  EdgeInsetsGeometry get verticalEdge {
    return EdgeInsets.symmetric(vertical: toDouble()) ;
  }

  EdgeInsetsGeometry get topEdge {
    return EdgeInsets.only(top: toDouble()) ;
  }

  EdgeInsetsGeometry get bottomEdge {
    return EdgeInsets.only(bottom: toDouble()) ;
  }

  EdgeInsetsGeometry get leftEdge {
    return EdgeInsets.only(left: toDouble()) ;
  }

  EdgeInsetsGeometry get rightEdge {
    return EdgeInsets.only(right: toDouble()) ;
  }

  EdgeInsetsGeometry customOnly({double? top, double? bottom, double? left, double? right}) {
    return EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0
    ) ;
  }

  EdgeInsetsGeometry customSymmetric({double? horizontal, double? verticle}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: verticle ?? 0
    ) ;
  }

}