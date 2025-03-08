import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/screens/settings/modal_bottom_sheet/activate_account_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class DeleteAccountBottomSheet extends StatefulWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  State<DeleteAccountBottomSheet> createState() => _DeleteAccountBottomSheetState();
}

class _DeleteAccountBottomSheetState extends State<DeleteAccountBottomSheet> {
  bool showLoading = false;
  bool accDeleted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 2, vertical: kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kPadding * 2),
            accDeleted
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: kPadding * 4),
                      const Text(
                          "Your account has been temporarily deleted. \nYou have 14 days to reactivate your account.\nAfter this period, your account will be permanently deleted.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: kLightGreyColor)),
                      const SizedBox(height: kPadding * 6),
                      SizedBox(
                        height: size.height / 100 * 6,
                        width: size.width ,
                        child: CustomButton(
                            onPressed: () {
                              Navigator.pop(context);

                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (conext) {
                                    return SizedBox(
                                        height: size.height / 100 * 40,
                                        child: const ReactivateAccountBottomSheet());
                                  });
                            },
                            showLoadingIndicator: true,
                            text: "Done"),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.images.deleteAccountPNG,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: kPadding * 2),
                      const Text(
                        "Leaving us behind!",
                        style: TextStyle(
                            fontSize: 17,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: kPadding * 3),
                      const Text(
                          "Are you sure you want to delete your account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: kLightGreyColor)),
                      const SizedBox(height: kPadding * 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height / 100 * 6,
                            width: size.width / 100 * 30,
                            child: CustomButton(
                              onPressed: () {
                                setState(() {
                                  accDeleted = true;
                                });
                              },
                              text: "Delete",
                              negativeColor: true,
                              showLoading: showLoading,
                            ),
                          ),
                          const SizedBox(width: kPadding * 2),
                          SizedBox(
                            height: size.height / 100 * 6,
                            width: size.width / 100 * 30,
                            child: CustomButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                showLoadingIndicator: true,
                                text: "Cancel"),
                          ),
                        ],
                      ),
                    ],
                  ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    );
  }
}
