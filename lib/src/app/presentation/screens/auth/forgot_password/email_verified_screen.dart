import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class EmailVerifiedScreen extends StatelessWidget {
 const  EmailVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // <------------------------  IMAGE ------------------------>

          Image.asset(
            Assets.images.emailVerifiedPNG,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: kPadding * 3),
          // <------------------------  BODY ------------------------>
          const Text("Email verification is complete",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor)),
          const SizedBox(height: kPadding * 2),

          const Text("Good luck & have fun.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: kLightGreyColor)),

          const SizedBox(height: kPadding * 3),

          SizedBox(
            height: size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
                
                  RouteNavigator.replacementroute(context, const SplashScreen());
                },
                showLoadingIndicator: true,
                text: "Done"),
          ),
        ],
      ),
    );
  }
}
