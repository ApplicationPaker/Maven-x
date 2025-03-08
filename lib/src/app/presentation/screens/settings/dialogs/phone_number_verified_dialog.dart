import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class PhoneNumberVerifiedDialog extends StatelessWidget {
  const PhoneNumberVerifiedDialog({super.key});

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
            const Text(
              "Phone Number Verified",
              style: TextStyle(
                  fontSize: 17, color: kWhiteColor, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 3),
            const Text(
                "Your account integrity has been verified! You can upload imported videos. Remember, any content that violates our Community Standards will be removed and may result in a temporary or permanent account ban.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kLightGreyColor)),
            const SizedBox(height: kPadding * 6),
            SizedBox(
              height: size.height / 100 * 6,
              child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, showLoadingIndicator: true, text: "Done"),
            ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    );
  }
}
