import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/navbar/bottom_navbar.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/login_screen.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/add_bio_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_avatar_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_birthdate_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_favorite_person_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_game_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/steps_completed_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {





  isUserlogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   
    // TokenService tokenService = TokenService();
    // tokenService.getDeviceToken().then((value) async {
    //   debugPrint("Token Value*************");
    //   debugPrint(value);
    //   await prefs.setString('userDeviceToken', value);
    // });

    // <------------------------  FETCHING USER TOKEN ------------------------>
    final authData = Provider.of<AuthPro>(context, listen: false);
    final stepData = Provider.of<StepperPro>(context, listen: false);
    stepData.goToStep(0);
    await authData.getCurrentUserDetailsFunc(context);

    await Future.delayed(const Duration(seconds: 2));
    final String? userId = prefs.getString('username');
    log("username $userId");

    // debugPrint(
    //     "authData.userDetailData!.user!.emailConfirmed: ${authData.userDetailData!.user!.emailConfirmed.toString()}");
    if (userId != null
        // &&
        //     authData.userDetailData!.user!.emailConfirmed != false
        ) {
      if (authData.userDetailData!.user!.onboardingStep == 1) {
        stepData.goToStep(1);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const SelectBirthdateStep());
      } else if (authData.userDetailData!.user!.onboardingStep == 2) {
        stepData.goToStep(2);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const SelectAvatarStep());
      } else if (authData.userDetailData!.user!.onboardingStep == 3) {
        stepData.goToStep(3);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const SelectGameStep());
      } else if (authData.userDetailData!.user!.onboardingStep == 4) {
        stepData.goToStep(4);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const SelectFavoritePersonStep());
      } else if (authData.userDetailData!.user!.onboardingStep == 5) {
        stepData.goToStep(5);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const AddBioStep());
      } else if (authData.userDetailData!.user!.onboardingStep == 6) {
        stepData.goToStep(6);
        // ignore: use_build_context_synchronously
        RouteNavigator.route(context, const StepsCompletedScreen());
      } else {
        // ignore: use_build_context_synchronously
        RouteNavigator.replacementroute(context, BottomNavBar(selectedTab: 0));
      }
    } else {
      // ignore: use_build_context_synchronously
      RouteNavigator.replacementroute(context, const LoginScreen());
    }
  }
}
