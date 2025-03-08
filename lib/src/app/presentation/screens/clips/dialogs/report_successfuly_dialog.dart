import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class ReportSuccessfullyDialog extends StatefulWidget {
  const ReportSuccessfullyDialog({
    super.key,
  });

  @override
  State<ReportSuccessfullyDialog> createState() =>
      _ReportSuccessfullyDialogState();
}

class _ReportSuccessfullyDialogState extends State<ReportSuccessfullyDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2, vertical: kPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Thank you for your report.",
              style: TextStyle(
                  fontSize: 17,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: kPadding * 3,
          ),
          const Center(
            child: Text(
              "Our review team is now evaluating the information you provided and will take the necessary actions based on their findings.\n\nFor your immediate comfort, you have the option to block this user. This will prevent any of their content from appearing to you on our site.\n\nYour vigilance helps us maintain a safe and enjoyable community for everyone.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: kPadding * 3),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                showLoadingIndicator: true,
                text: "Done"),
          ),
        ],
      ),
    );
  }
}
