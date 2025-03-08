import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/global_text_field.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_birthdate_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  bool passwordVisibility = true;
  bool confirPasswordVisibility = true;

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
                  "Sign Up",
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

            // <------------------------  FIRST NAME & LAST NAME ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.name,
              ],
              controller: fullNameController,
              hintText: "Full Name",
              validator: (s) => Utils.validateInput(
                s,
              ),
            ),
            const SizedBox(height: kPadding * 3),

            // <------------------------  EMAIL ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.email,
              ],
              controller: emailAddressController,
              hintText: "Email",
              validator: (s) => Utils.validateInput(s, isEmail: true),
            ),
            const SizedBox(height: kPadding * 3),

            // <------------------------  USERNAME ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.name,
              ],
              controller: userNameController,
              hintText: "Username",
              validator: (s) => Utils.validateInput(s),
            ),

            const SizedBox(height: kPadding * 3),

            // <------------------------  PHONE NO ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.telephoneNumber,
              ],
              controller: phoneNoController,
              hintText: "305xxxxxxxx",
              preffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "+92 |",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kLightGreyColor),
                ),
              ),
              validator: (s) => Utils.validateInput(s),
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
            const SizedBox(height: kPadding * 3),
            // <------------------------  CONFIRM PASSWORD ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.password,
              ],
              controller: confirmPasswordController,
              obscureText: confirPasswordVisibility,
              hintText: "Confirm Password",
              maxLine: 1,
              suffixIcon: InkWell(
                onTap: () => setState(
                  () => confirPasswordVisibility = !confirPasswordVisibility,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  confirPasswordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kLightGreyColor,
                  size: 22.0,
                ),
              ),
              validator: (s) => Utils.validateInput(s,
                  minValue: 6, match: passwordController.text),
            ),

            const SizedBox(height: kPadding * 3),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  side: const BorderSide(
                    color: kPrimaryColor,
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return kLightGreyColor;
                  }),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                ),
                const Flexible(
                  child: Text(
                    "By clicking Sign Up, you are agreeing to Maven X's Terms of Service & are acknowledging our Privacy Notice applies",
                    style: TextStyle(
                        fontSize: 13,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 3),
            Consumer<StepperPro>(builder: (context, stepValue, child) {
              return SizedBox(
                height: size.height / 100 * 6,
                child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final authProvider =
                            Provider.of<AuthPro>(context, listen: false);
                        authProvider.accountSignupFunc(
                            fullNameController.text,
                            userNameController.text,
                            emailAddressController.text,
                            passwordController.text,
                            phoneNoController.text,
                            context);
                      }
                      // stepValue.nextStep();
                      // RouteNavigator.route(context, const SelectBirthdateStep());
                    },
                    showLoadingIndicator: true,
                    text: "Sign Up"),
              );
            }),

            const SizedBox(height: kPadding * 3),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Already a MAVEN? ",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kWhiteColor),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                      text: "Login",
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
