import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class VideoQualityDialog extends StatefulWidget {
  const VideoQualityDialog({super.key});

  @override
  State<VideoQualityDialog> createState() => _VideoQualityDialogState();
}

class _VideoQualityDialogState extends State<VideoQualityDialog> {
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
              "Video Quality",
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
          Container(
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius / 2),
                color: kGreyButtonColor),
            child: Column(
              children: [
                reportRadioListTileWidget("Auto"),
                reportRadioListTileWidget("1080p"),
                reportRadioListTileWidget("720p"),
                reportRadioListTileWidget("480p"),
                reportRadioListTileWidget("360p"),
                reportRadioListTileWidget("144p"),
              ],
            ),
          ),
          const SizedBox(height: kPadding * 2),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100 * 6,
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                showLoadingIndicator: true,
                text: "Done"),
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
