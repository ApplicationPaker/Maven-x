import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/global_text_field.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/forgot_password/verify_email_screen.dart';
import 'package:mavenx/src/app/presentation/screens/auth/signup_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;
  bool stayLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      isLogoShow: true,
      widget: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: kLightGreyColor, size: 15),
                      Text(
                        " Back",
                        style: TextStyle(
                            fontSize: 14,
                            color: kLightGreyColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 23,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: kPadding * 2,
                )
              ],
            ),
            const SizedBox(height: kPadding * 3),

            // <------------------------  EMAIL ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.email,
              ],
              controller: emailAddressController,
              hintText: "Username or Email",
              validator: (s) => Utils.validateInput(
                s,
                // isEmail: true
              ),
            ),
            const SizedBox(height: kPadding * 3),

            // <------------------------  PASSWORD ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.password,
              ],
              controller: passwordController,
              obscureText: passwordVisibility,
              hintText: "Password",
              maxLine: 1,
              suffixIcon: InkWell(
                onTap: () => setState(
                  () => passwordVisibility = !passwordVisibility,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  passwordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kLightGreyColor,
                  size: 22.0,
                ),
              ),
              validator: (s) => Utils.validateInput(s, minValue: 6),
            ),

            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: GestureDetector(
                onTap: () {
                  RouteNavigator.route(context, const VerifyEmailScreen());
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: kPadding * 2),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 15,
                        color: kLightGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),

            const SizedBox(height: kPadding * 3),

            Row(
              children: [
                Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: stayLoggedIn,
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  onChanged: (value) {
                    setState(() {
                      stayLoggedIn = value;
                    });
                  },
                ),
                const SizedBox(
                  width: kPadding,
                ),
                const Text(
                  "Stay logged in",
                  style: TextStyle(
                      fontSize: 15,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 4),

            SizedBox(
              height: size.height / 100 * 6,
              child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final authProvider =
                          Provider.of<AuthPro>(context, listen: false);
                      authProvider.accountLoginFunc(emailAddressController.text,
                          passwordController.text, context);
                    }
                  },
                  showLoadingIndicator: true,
                  text: "Log In"),
            ),
            const SizedBox(height: kPadding * 3),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Still not a MAVEN? ",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kWhiteColor),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.pop(context);
                          RouteNavigator.route(context, const SignupScreen());
                        },
                      text: "Signup ➔",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
