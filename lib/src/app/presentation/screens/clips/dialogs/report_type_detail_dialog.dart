import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/global_text_field.dart';
import 'package:mavenx/src/app/presentation/screens/clips/dialogs/report_successfuly_dialog.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';

class ReportTypeDetailDialog extends StatefulWidget {
  final String reportType;
  const ReportTypeDetailDialog({super.key, required this.reportType});

  @override
  State<ReportTypeDetailDialog> createState() => _ReportTypeDetailDialogState();
}

class _ReportTypeDetailDialogState extends State<ReportTypeDetailDialog> {
  final TextEditingController reportDescriptionController =
      TextEditingController();

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
              "Report Live Stream",
              style: TextStyle(
                  fontSize: 17,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: kPadding * 2,
          ),
          const Center(
            child: Divider(
              color: kLightGreyColor,
              height: 30,
            ),
          ),
          const Text(
            "Why are you submitting this report?",
            style: TextStyle(
                fontSize: 15, color: kWhiteColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: kPadding * 2),
          Container(
              padding: const EdgeInsets.all(kPadding * 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius / 2),
                  color: kGreyButtonColor),
              child: Center(
                child: Text(
                  widget.reportType,
                  style: const TextStyle(
                      fontSize: 20,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500),
                ),
              )),
          const SizedBox(height: kPadding * 2),
          const Text(
            "Tell us more",
            style: TextStyle(
                fontSize: 15, color: kWhiteColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: kPadding * 2),
          Container(
            padding: const EdgeInsets.all(kPadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius / 2),
                color: kGreyButtonColor),
            child: GlobalTextField(
              autofillHints: const [
                AutofillHints.name,
              ],
              controller: reportDescriptionController,
              hintText: "",
              maxLength: 1000,
              validator: (s) => Utils.validateInput(
                s,
              ),
            ),
          ),
          const SizedBox(height: kPadding * 3),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);

                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (conext) {
                        return SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 100 * 45,
                            child: const ReportSuccessfullyDialog(
                             
                            ));
                      });
                },
                showLoadingIndicator: true,
                text: "Submit"),
          ),
          const SizedBox(height: kPadding * 2),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: kLightGreyColor)),
            ),
          ),
        ],
      ),
    );
  }
}
