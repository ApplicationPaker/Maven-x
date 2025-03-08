import 'package:flutter/cupertino.dart';

class AppConstants {
  AppConstants._() ;

  static double mediaWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width ;
  }

  static double mediaHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height ;
  }

}



// https://www.figma.com/file/4Hg5lvvwYOClD0pYJ6tMYG/IOS-mobile-App-MavenX?type=design&node-id=1099-4081&mode=design&t=2ID6ROngQxu4Veqf-0