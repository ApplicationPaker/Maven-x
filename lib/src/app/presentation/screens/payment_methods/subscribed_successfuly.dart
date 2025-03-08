import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/navbar/bottom_navbar.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class SubscribedSuccessfulyScreen extends StatelessWidget {
  const SubscribedSuccessfulyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // <------------------------  IMAGE ------------------------>

          ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Image.network(
              "https://www.figma.com/file/ZQtVBdUfQaDDRCN1QGxD1C/image/ec5fa789382b9e4e2c384029ebda0b6a0b08ad70",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: kPadding * 3),
          // <------------------------  BODY ------------------------>
          const Text("Subscribed Successfully!",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor)),
          const SizedBox(height: kPadding * 2),

          const Text('Great! you have subscribed "FazeKayzen" successfully',
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
                  RouteNavigator.replacementroute(
                      context, BottomNavBar(selectedTab: 0));
                },
                showLoadingIndicator: true,
                text: "Done"),
          ),
        ],
      ),
    );
  }
}
