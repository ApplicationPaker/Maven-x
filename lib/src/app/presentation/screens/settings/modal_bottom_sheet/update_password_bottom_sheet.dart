import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/global_text_field.dart';
import 'package:mavenx/src/app/presentation/screens/settings/modal_bottom_sheet/verify_phone_number_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';

class UpdatePasswordBottomSheet extends StatefulWidget {
  const UpdatePasswordBottomSheet({super.key});

  @override
  State<UpdatePasswordBottomSheet> createState() => _UpdatePasswordBottomSheetState();
}

class _UpdatePasswordBottomSheetState extends State<UpdatePasswordBottomSheet> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool oldPasswordVisibility = true;
  bool passwordVisibility = true;

  bool confirPasswordVisibility = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding*2,vertical: kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kPadding * 2),

            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Reset your password",
                style: TextStyle(
                    fontSize: 17, color: kWhiteColor, fontWeight: FontWeight.w400),
              ),
            ),
        
            const SizedBox(height: kPadding * 3),
            // <------------------------  OLD PASSWORD ------------------------>
            GlobalTextField(
              autofillHints: const [
                AutofillHints.password,
              ],
              controller: oldPasswordController,
              obscureText: oldPasswordVisibility,
              hintText: "Old Password",
              maxLine: 1,
              suffixIcon: InkWell(
                onTap: () => setState(
                  () => oldPasswordVisibility = !oldPasswordVisibility,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  oldPasswordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kLightGreyColor,
                  size: 22.0,
                ),
              ),
              validator: (s) => Utils.validateInput(s, minValue: 6),
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
              validator: (s) => Utils.validateInput(s, minValue: 6),
            ),
        
            const SizedBox(height: kPadding * 6),
            SizedBox(
              height: size.height / 100 * 6,
             
              child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                      showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (conext) { 
                                      return SizedBox(
                                          height: size.height / 100 * 65,
                                          child: const VerifyPhoneNumberBottomSheet());
                                    });
                 
                  },
                  showLoadingIndicator: true,
                  text: "Update Password"),
            ),
            const SizedBox(height: kPadding * 2),
            
          ],
        ),
      ),
    );
  }
}
