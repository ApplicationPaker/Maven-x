import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/screens/settings/dialogs/connected_successfuly_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class NoInternetBottomSheet extends StatefulWidget {
  const NoInternetBottomSheet({super.key});

  @override
  State<NoInternetBottomSheet> createState() => _NoInternetBottomSheetState();
}

class _NoInternetBottomSheetState extends State<NoInternetBottomSheet> {
  bool showLoading = false;
  bool accDeleted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              Assets.images.noInternetPNG,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: kPadding * 3),
          const Text(
            "Failed to connect, \nPlease try again",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: kWhiteColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: kPadding * 3),
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
                                          height: size.height / 100 * 40,
                                          child: const ConnectedSuccessfullyBottomSheet());
                                    });
              
              },
              showLoadingIndicator: true,
              text: "Got it",
            ),
          ),
        ],
      ),
    );
  }
}
