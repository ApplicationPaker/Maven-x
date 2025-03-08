import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class VerificationCodeScreen extends StatefulWidget {
  final String email;
  const VerificationCodeScreen({super.key, required this.email});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  void initState() {
    // Provider.of<AuthPro>(context, listen: false)
    //     .sendEmailVerificationCodeFunc(widget.email, context);
    super.initState();
  }

  var textStyle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: kLightGreyColor);
  String pinOTP = '';
  bool showLoading = false;

  //* ------------------ Confirm OTP ------------------

  Future<void> confirmOTP() async {
    setState(() {
      showLoading = true;
    });
    await Provider.of<AuthPro>(context, listen: false)
        .verifyOTPCodeFunc(widget.email, pinOTP, context);

    setState(() {
      showLoading = false;
    });
  }

  bool isResendButtonEnabled = true;
  int timerCountdown = 50;
  late Timer _resendTimer;

  void resendOTPCode() async {
    setState(() {
      isResendButtonEnabled = false;
    });
    timerCountdown = 50;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timerCountdown -= 1;
      });
      if (timerCountdown <= 0) {
        _resendTimer.cancel();
        setState(() {
          isResendButtonEnabled = true;
        });
      }
    });

    await Provider.of<AuthPro>(context, listen: false)
        .sendEmailVerificationCodeFunc(widget.email, context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
        widget: Consumer<AuthPro>(builder: (context, authValue, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // <------------------------  HEADLINE ------------------------>

          const Text("Enter your verification code",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor)),
          const SizedBox(height: kPadding * 3),
          // <------------------------  BODY ------------------------>

          Text("Please check your email.",
              textAlign: TextAlign.center, style: textStyle),
          Text("(${authValue.userDetailData!.user!.email.toString()})",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, color: kRedColor)),
          Text("Confirm it belongs to you to keep your account secure.",
              textAlign: TextAlign.center, style: textStyle),
          const SizedBox(height: kPadding * 4),

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
            onSubmitted: (val) {
              // confirmOTP();
            },
            onChanged: (val) {
              setState(() {
                pinOTP = val;
              });
            },
          ),
          const SizedBox(height: kPadding),
          isResendButtonEnabled
              ? GestureDetector(
                  onTap: () {
                    if (isResendButtonEnabled) {
                      resendOTPCode();
                    }
                  },
                  child: const Text("Resend Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor)),
                )
              : const SizedBox(),
          const SizedBox(height: kPadding),
          !isResendButtonEnabled
              ? Text("$timerCountdown Seconds",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: kWhiteColor))
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding * 2.5),
            child: Text.rich(
              TextSpan(
                text: "Update email? ",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                    text: "Go to settings",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  )
                ],
              ),
            ),
          ),
          Text(
              "MAVEN X may use your email to send notifications with information regarding your account.",
              textAlign: TextAlign.center,
              style: textStyle),
          const SizedBox(height: kPadding * 3),

          SizedBox(
            height: size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
               
                  confirmOTP();
                },
                showLoading: showLoading,
                text: "Submit"),
          ),
          const SizedBox(height: kPadding * 2),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kLightGreyColor)),
          ),
        ],
      );
    }));
  }
}
