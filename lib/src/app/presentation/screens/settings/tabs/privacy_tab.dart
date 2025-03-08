import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/navigation_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/profile/blocked_channels_screen.dart';
import 'package:mavenx/src/app/presentation/screens/settings/block_user_screen.dart';
import 'package:mavenx/src/app/presentation/screens/settings/code_verification_screen.dart';
import 'package:mavenx/src/app/presentation/screens/settings/modal_bottom_sheet/delete_account_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/screens/settings/modal_bottom_sheet/update_password_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

enum VerifyCode {
  email("Email"),
  phone("Phone Number");

  final String title;
  const VerifyCode(this.title);
}

// ignore: must_be_immutable
class PrivacyTab extends StatefulWidget {
  const PrivacyTab({super.key});

  @override
  State<PrivacyTab> createState() => _PrivacyTabState();
}

class _PrivacyTabState extends State<PrivacyTab> {
  bool showLoading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  String selectcounrtyCode = '';
  final TextEditingController searchController = TextEditingController();
  String? selectedRadioTile;
  setSelectedRadioTile(String? value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

  var verifyCode = VerifyCode.email;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // <------------------------  VERIFY PHONE NUMBER SECTION ------------------------>

          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(kPadding * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius * 2),
                  color: kTertiaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // <------------------------  VERIFY PHONE NUMBER SECTION ------------------------>

                  const Text(
                    "Verify Phone Number",
                    style: TextStyle(
                        fontSize: 14,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: kPadding * 2),
                  const Text(
                    "Verification is required for safety & security reasons. Maven X will never contact you using your phone number.",
                    style: TextStyle(
                        fontSize: 13,
                        color: kLightGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: kPadding * 2),

                  IntlPhoneField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ktextfieldColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kRadius),
                          borderSide: const BorderSide(color: kTertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kRadius),
                          borderSide: const BorderSide(color: kTertiaryColor)),
                      contentPadding: const EdgeInsets.all(kPadding / 2),
                    ),
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: kBlackColor,
                      countryCodeStyle: const TextStyle(
                          fontSize: 15,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                      countryNameStyle: const TextStyle(
                          fontSize: 15,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                    initialCountryCode: "PK",
                    style: const TextStyle(
                        fontSize: 15,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400),
                    onChanged: (country) {
                      setState(() {
                        selectcounrtyCode = country.countryCode;
                      });

                      debugPrint(
                          'Selected Country Code: ${country.countryCode}, Phone Number: ${country.countryCode + phoneNumberController.text}');
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    flagsButtonMargin:
                        const EdgeInsets.symmetric(horizontal: kPadding),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    disableLengthCheck: true,
                  ),

                  const SizedBox(height: kPadding * 2),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useRootNavigator: false,
                            builder: (context) {
                              return showConfirmPhoneSheet();
                            });
                      },
                      text: "Send Code",
                      showLoading: showLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(kPadding * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius * 2),
                      color: kTertiaryColor),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // <------------------------  TWO FACTOR SECTION ------------------------>

                        const Text(
                          "Two-Factor Authentication",
                          style: TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        const Text(
                          "Add an extra layer of security to your Maven X account by using your password and a code on your mobile phone to log in.",
                          style: TextStyle(
                              fontSize: 13,
                              color: kLightGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        const Text(
                          "Verify Through",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              VerifyCode.email.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: kWhiteColor),
                            ),
                            Radio(
                                value: VerifyCode.email,
                                groupValue: verifyCode,
                                onChanged: (VerifyCode? val) {
                                  setState(() {
                                    verifyCode = val!;
                                  });
                                })
                          ],
                        ),

                        5.sh,

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              VerifyCode.phone.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: kWhiteColor),
                            ),
                            Radio(
                                value: VerifyCode.phone,
                                groupValue: verifyCode,
                                onChanged: (VerifyCode? val) {
                                  setState(() {
                                    verifyCode = val!;
                                  });
                                })
                          ],
                        ),

                    
                      ]))),
          // // <------------------------  KEEP ACCOUNT SAFE SECTION ------------------------>
          Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(kPadding * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius * 2),
                      color: kTertiaryColor),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Keep your account safe and secure",
                          style: TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        const Text(
                          "Improve your security with a strong password.",
                          style: TextStyle(
                              fontSize: 13,
                              color: kLightGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: kPadding, top: kPadding),
                          child: CustomButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (conext) {
                                    return SizedBox(
                                        height: size.height / 100 * 50,
                                        child:
                                            const UpdatePasswordBottomSheet());
                                  });
                            },
                            text: "Change Password",
                            showLoading: showLoading,
                          ),
                        ),
                      ]))),
          // <------------------------  BLOCK PEOPLE SAFE SECTION ------------------------>
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(kPadding * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius * 2),
                  color: kTertiaryColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Block User",
                      style: TextStyle(
                          fontSize: 14,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Is someone giving you a hard time? Block them and they won't be able to tag you, comment on your clips, or message you.",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: kPadding),
                            child: CustomButton(
                              onPressed: () {
                                const BlockUserScreen().push(context);
                              },
                              text: "Block a User",
                              negativeColor: true,
                              showLoading: showLoading,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: kPadding),
                            child: CustomButton(
                              onPressed: () async {
                                RouteNavigator.route(
                                    context, const BlockedChannelsScreen());
                              },
                              text: "View List",
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),

          // <------------------------  DELETE ACCOUNT SECTION ------------------------>
          Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(kPadding * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius * 2),
                      color: kTertiaryColor),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delete Account",
                          style: TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        const Text(
                          "Deleting your account is permanent and your account will not be able to be recovered.",
                          style: TextStyle(
                              fontSize: 13,
                              color: kLightGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        CustomButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (conext) {
                                  return SizedBox(
                                      height: size.height / 100 * 40,
                                      child: const DeleteAccountBottomSheet());
                                });
                          },
                          text: "Delete Account",
                          showLoading: showLoading,
                        ),
                      ]))),
        ],
      ),
    );
  }

  showConfirmPhoneSheet() {
    return Container(
      width: AppConstants.mediaWidth(context),
      padding: 20.allEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Confirm Your Phone Number",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: kWhiteColor),
          ),
          20.sh,
          SizedBox(
            width: AppConstants.mediaWidth(context),
            child: Text(
              "We will send 6 digit verification code to:",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: kSecondaryTextColor),
            ),
          ),
          20.sh,
          Text(
            "+966 12345678",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kWhiteColor),
          ),
          20.sh,
          Text(
            'We will use this phone number for',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: kSecondaryTextColor),
          ),
          Text(
            "Two-Factor Authentication",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: kSecondaryTextColor),
          ),
          30.sh,
          CustomButton(
              width: AppConstants.mediaWidth(context),
              onPressed: () {
                const CodeVerificationScreen().push(context);
              },
              text: "Confirm"),
          10.sh,
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kSecondaryTextColor),
              ))
        ],
      ),
    );
  }
}
