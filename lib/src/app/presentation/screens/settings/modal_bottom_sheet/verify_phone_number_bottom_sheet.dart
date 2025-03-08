import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/screens/settings/dialogs/phone_number_verified_dialog.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneNumberBottomSheet extends StatelessWidget {
  const VerifyPhoneNumberBottomSheet({super.key});

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
              "Verify Phone Number",
              style: TextStyle(
                  fontSize: 17, color: kWhiteColor, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 3),
            const Text(
                "Before you can upload imported videos, please verify your phone number. Verification is required for safety and security purpose. Maven X will never contact you using your phone number.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kLightGreyColor)),
            const Text("Confirm it belongs to you to keep your account secure.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kLightGreyColor)),
            const SizedBox(height: kPadding * 2),
            const Text("Enter 6-digit code we sent you on your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400, color: kWhiteColor)),
            const SizedBox(height: kPadding * 3),
            PinCodeTextField(
              backgroundColor: Colors.transparent,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              appContext: context,
              length: 6,
              textStyle: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w400, color: kWhiteColor),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              autoFocus: true,
              showCursor: true,
              cursorHeight: kPadding * 3,
              cursorColor: kWhiteColor,
              obscureText: false,
              pinTheme: PinTheme(
                fieldWidth: 50,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(kRadius * 2),
                inactiveColor: kWhiteColor,
                selectedColor: kLightGreyColor,
                activeFillColor: kPrimaryColor,
                selectedFillColor: kWhiteColor,
              ),
              validator: (s) => Utils.validateInput(s, isRequired: true),
              onSubmitted: (val) {},
              onChanged: (val) {},
            ),
            const SizedBox(height: kPadding),
            const Text("Resend code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            const SizedBox(height: kPadding),
            const Text("00:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.w500, color: kWhiteColor)),
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
                                          height: size.height / 100 * 35,
                                          child: const PhoneNumberVerifiedDialog());
                                    });
                   
                  },
                  showLoadingIndicator: true,
                  text: "Submit"),
            ),
            const SizedBox(height: kPadding * 2),
             TextButton(
                onPressed: () {},
                child: const Text("Cancel",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: kLightGreyColor)),
              ),
          ],
        ),
      ),
    );
  }
}
