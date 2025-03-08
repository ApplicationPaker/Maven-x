import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on Widget {

  push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => this)
    ) ;
  }


  pushReplacement(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => this)
    ) ;
  }

}