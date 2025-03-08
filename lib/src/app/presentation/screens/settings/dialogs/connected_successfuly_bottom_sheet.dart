import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class ConnectedSuccessfullyBottomSheet extends StatefulWidget {
  const ConnectedSuccessfullyBottomSheet({super.key});

  @override
  State<ConnectedSuccessfullyBottomSheet> createState() =>
      _ConnectedSuccessfullyBottomSheetState();
}

class _ConnectedSuccessfullyBottomSheetState
    extends State<ConnectedSuccessfullyBottomSheet> {
  bool showLoading = false;
  bool accDeleted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.images.connetectedPNG,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: kPadding * 3),
          const Text(
            "Connected Successfully!",
            style: TextStyle(
                fontSize: 14, color: kWhiteColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: kPadding * 3),
          SizedBox(
            height: size.height / 100 * 6,
            child: CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              showLoadingIndicator: true,
              text: "Done",
            ),
          ),
        ],
      ),
    );
  }
}
