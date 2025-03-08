import 'package:flutter/cupertino.dart';

extension SizedBoxExtension on num {

  SizedBox get sh {
    return SizedBox(
      height: toDouble(),
    ) ;
  }

  SizedBox get sw {
    return SizedBox(
      width: toDouble(),
    ) ;
  }


}