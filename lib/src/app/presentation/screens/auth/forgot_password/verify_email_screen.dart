import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/forgot_password/verification_code_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      widget: Consumer<AuthPro>(builder: (context, authValue, child) {
        return authValue.userCurrentDataIsLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Verify your email",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor)),
                  const SizedBox(height: kPadding * 3),
                  const Text("We will send you a 6 digit verification code to:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kLightGreyColor)),
                  const SizedBox(height: kPadding * 6),
                  Text(authValue.userDetailData!.user!.email.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor)),
                  const SizedBox(height: kPadding * 6),
                  SizedBox(
                    height: size.height / 100 * 6,
                    child: CustomButton(
                        onPressed: () {
                          RouteNavigator.route(
                              context, VerificationCodeScreen(email: authValue.userDetailData!.user!.email.toString(),));
                        },
                        showLoadingIndicator: true,
                        text: "Send Code"),
                  ),
                  const SizedBox(height: kPadding * 2),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Edit email",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: kLightGreyColor)),
                  ),
                ],
              );
      }),
    );
  }
}
