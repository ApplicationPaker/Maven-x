import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/screens/clips/dialogs/report_type_detail_dialog.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class ReportTypeDialog extends StatefulWidget {
  const ReportTypeDialog({super.key});

  @override
  State<ReportTypeDialog> createState() => _ReportTypeDialogState();
}

class _ReportTypeDialogState extends State<ReportTypeDialog> {
  String? selectedRadioTile;
  setSelectedRadioTile(String? value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

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
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius / 2),
                color: kGreyButtonColor),
            child: Column(
              children: [
                reportRadioListTileWidget("Violence or Gore"),
                reportRadioListTileWidget("Bullying or Harassment"),
                reportRadioListTileWidget("Hateful Conduct"),
                reportRadioListTileWidget("Miscategorized Content"),
                reportRadioListTileWidget("Self Harm"),
                reportRadioListTileWidget("Nudity & Sexually Explicit"),
                reportRadioListTileWidget("Spam, Scams or Bots"),
                reportRadioListTileWidget("Terrorism"),
                reportRadioListTileWidget("Others"),
              ],
            ),
          ),
          const SizedBox(height: kPadding * 2),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (conext) {
                                    return SizedBox(
                                        height: MediaQuery.of(context).size.height / 100 * 55,
                                        child: const ReportTypeDetailDialog(reportType: "Violence or Gore",));
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
              child: const Text("Cancel",
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

  RadioListTile<String> reportRadioListTileWidget(String value) {
    return RadioListTile(
      contentPadding: const EdgeInsets.all(0),
      value: value,
      title: Text(
        value,
        style: const TextStyle(
            fontSize: 14, color: kWhiteColor, fontWeight: FontWeight.w400),
      ),
      fillColor: const MaterialStatePropertyAll(kWhiteColor),
      activeColor: kWhiteColor,
      groupValue: selectedRadioTile,
      onChanged: (value) {
        setSelectedRadioTile(value);
      },
    );
  }
}
