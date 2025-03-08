import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';import '../utils/assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
                            height: height
,
          child: Image.asset(
          Assets.images.appLogo,
          fit: BoxFit.cover,
         
          ),
        ),
        const Text(
                    "Maven X",
                    style: TextStyle(
                        fontSize: 23,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500),
                  ),
      ],
    );
  }
}
