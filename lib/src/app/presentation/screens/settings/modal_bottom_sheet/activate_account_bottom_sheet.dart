import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class ReactivateAccountBottomSheet extends StatefulWidget {
  const ReactivateAccountBottomSheet({super.key});

  @override
  State<ReactivateAccountBottomSheet> createState() =>
      _ReactivateAccountBottomSheetState();
}

class _ReactivateAccountBottomSheetState extends State<ReactivateAccountBottomSheet> {
  bool showLoading = false;
  bool accDeleted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: kPadding*2,vertical: kPadding),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            const SizedBox(height: kPadding * 2), 
            Center(
              child: Image.asset(
                Assets.images.robotPNG,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: kPadding * 2),
            const Text(
              "Happy to see you again :)",
              style: TextStyle(
                  fontSize: 17,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 3),
            const Text(
                "Your account was deleted, Are you sure \nyou want to re-activate your account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kLightGreyColor)),
            const SizedBox(height: kPadding * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: size.height / 100 * 6,
                    
                    child: CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        showLoadingIndicator: true,
                        text: "Yes"),
                  ),
                ),
                const SizedBox(width: kPadding * 2),
                Expanded(
                  child: SizedBox(
                    height: size.height / 100 * 6,
                    width: size.width / 100 * 30,
                    child: CustomButton(
                      onPressed: () {
                          Navigator.pop(context);
                              
                      },
                      text: "Cancel",
                      negativeColor: true,
                      showLoading: showLoading,
                    ),
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
