import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class BrowseFiltersBottomsheet extends StatefulWidget {
  const BrowseFiltersBottomsheet({super.key});

  @override
  State<BrowseFiltersBottomsheet> createState() =>
      _BrowseFiltersBottomsheetState();
}

class _BrowseFiltersBottomsheetState extends State<BrowseFiltersBottomsheet> {
  String? selectedRadioTile;
  setSelectedRadioTile(String? value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 2.5, vertical: kPadding * 2),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sort By",
                  style: TextStyle(
                      fontSize: 17,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 17,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(CupertinoIcons.flame),
                                       SizedBox(width: kPadding * 2),

                    Text(
                      "Recommended For You",
                      style: TextStyle(
                          fontSize: 17,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                  child: RadioListTile(
                    value: 'Recommended For You',
                    fillColor: const MaterialStatePropertyAll(kPrimaryColor),
                    activeColor: kWhiteColor,
                    groupValue: selectedRadioTile,
                    onChanged: (value) {
                      setSelectedRadioTile(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(color: kGreyColor, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(CupertinoIcons.arrow_down_right_square),
                    SizedBox(width: kPadding * 2),
                    Text(
                      "High to Low",
                      style: TextStyle(
                          fontSize: 17,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                  child: RadioListTile(
                    value: 'High to Low',
                    fillColor: const MaterialStatePropertyAll(kPrimaryColor),
                    activeColor: kWhiteColor,
                    groupValue: selectedRadioTile,
                    onChanged: (value) {
                      setSelectedRadioTile(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(color: kGreyColor, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(CupertinoIcons.arrow_up_right_square),
                    SizedBox(width: kPadding * 2),
                    Text(
                      "Low to High",
                      style: TextStyle(
                          fontSize: 17,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                  child: RadioListTile(
                    value: 'Low to High',
                    fillColor: const MaterialStatePropertyAll(kPrimaryColor),
                    activeColor: kWhiteColor,
                    groupValue: selectedRadioTile,
                    onChanged: (value) {
                      setSelectedRadioTile(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(color: kGreyColor, height: 30),
          ],
        ),
      ),
    );
  }
}
