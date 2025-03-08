import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mavenx/src/app/presentation/components/colored_text_field.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';

// ignore: must_be_immutable
class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  bool showLoading = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  List<String> socialLinksList = [
    '',
    'Twitter',
    'Instagram',
    'Facebook',
    'Youtube',
  ];
  String selectedLink = '';
  XFile? bannerImage;
  XFile? profileImage;

  Future<void> pickGalleryImage(String type) async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      setState(() {
        if (type == "banner") {
          bannerImage = picker;
        } else {
          profileImage = picker;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // <------------------------  VERIFY PHONE NUMBER SECTION ------------------------>

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
                  // <------------------------  Banner Image SECTION ------------------------>

                  const Text(
                    "Banner Image",
                    style: TextStyle(
                        fontSize: 15,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: kPadding * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      setBannerImage,
                      const SizedBox(height: kPadding * 2),
                      const Text(
                        "File format: JPEG, PNG, GIF (recommended 1454x600, max size 50MB)",
                        style: TextStyle(
                            fontSize: 13,
                            color: kLightGreyColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: kPadding * 2),
                      CustomButton(
                        onPressed: () => pickGalleryImage("banner"),
                        text: "Upload",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // <------------------------  PRofile IMage SECTION ------------------------>
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
                          "Profile Image",
                          style: TextStyle(
                              fontSize: 15,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: kPadding * 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            setProfileImage,
                            const SizedBox(
                              width: kPadding * 3,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width / 100 * 40,
                                  child: CustomButton(
                                    onPressed: () =>
                                        pickGalleryImage("profile"),
                                    text: "Add Profile Image",
                                    negativeColor: true,
                                    showLoading: showLoading,
                                  ),
                                ),
                                const Text(
                                  "Profile picture must be JPEG, PNG, GIF & cannot exceed 20MB.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kLightGreyColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ))
                          ],
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
                      "User Name",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    ColoredTextField(
                      autofillHints: const [
                        AutofillHints.name,
                      ],
                      controller: usernameController,
                      hintText: "User Name",
                      validator: (s) => Utils.validateInput(
                        s,
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    ColoredTextField(
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                      controller: emailAddressController,
                      hintText: "Email Address",
                      suffixIcon: const Icon(
                        Icons.edit_note_sharp,
                        color: kWhiteColor,
                      ),
                      validator: (s) => Utils.validateInput(s, isEmail: true),
                    ),
                    const SizedBox(height: kPadding),
                    Text.rich(
                      TextSpan(
                        text: "Unverified email. ",
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: kLightGreyColor),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                            text: "Verify ",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Your Birthday",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    ColoredTextField(
                      autofillHints: const [
                        AutofillHints.birthday,
                      ],
                      suffixIcon: InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                          ).then((value) {
                            setState(() {
                              birthdateController.text = value.toString();
                            });
                          });
                        },
                        child: const Icon(
                          Icons.date_range,
                          color: kWhiteColor,
                        ),
                      ),
                      controller: birthdateController,
                      hintText: "Your Birthday",
                      validator: (s) => Utils.validateInput(
                        s,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    const Text(
                      "Your date of birth will not be shown publicly.",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Bio",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    ColoredTextField(
                      autofillHints: const [
                        AutofillHints.birthday,
                      ],
                      maxLine: 3,
                      controller: birthdateController,
                      hintText:
                          "Tell users a bit about yourself in 200 characters",
                      validator: (s) => Utils.validateInput(
                        s,
                      ),
                    ),
                  ]),
            ),
          ),

          // <------------------------  FOLLOWED GAMES SECTION ------------------------>
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Followed Games",
                          style: TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(kPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                    color: ktextfieldColor),
                                child: const Icon(
                                  Icons.arrow_left,
                                  size: 25,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: kPadding),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(kPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                    color: ktextfieldColor),
                                child: const Icon(
                                  Icons.arrow_right,
                                  size: 25,
                                  color: kWhiteColor,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: kPadding * 2),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                              color: ktextfieldColor,
                              borderRadius: BorderRadius.circular(kRadius)),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: kPadding * 2),
                        Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(4, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding / 2),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(kRadius),
                                      child: Image.asset(
                                       Assets.images.gameJPG,
                                        fit: BoxFit.cover,
                                        width: 80,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 4,
                                      right: 4,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.all(kPadding / 3),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                kRadius / 2),
                                            color: kWhiteColor),
                                        child: const Icon(
                                          Icons.remove,
                                          color: kRedColor,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
          // <------------------------  SOCIAL LINKS SECTION ------------------------>
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
                      "Social Links",
                      style: TextStyle(
                          fontSize: 15,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Add up to 4 social links that will display on your channel profile. Viewers will also be able to search you by these.",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Link Name",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      padding: const EdgeInsets.all(kPadding / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          color: ktextfieldColor),
                      child: DropdownButton<String>(
                        value: selectedLink,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kLightGreyColor),
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(kRadius),
                        focusColor: Colors.transparent,
                        elevation: 1,
                        isExpanded: true,
                        dropdownColor: Theme.of(context).colorScheme.surface,
                        onChanged: (value) {
                          setState(() {
                            selectedLink = value!;
                          });
                        },
                        items: socialLinksList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Text shown for the link",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Link URL",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          color: ktextfieldColor),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ColoredTextField(
                                autofillHints: const [
                                  AutofillHints.url,
                                ],
                                controller: birthdateController,
                                hintText: "URL",
                                validator: (s) => Utils.validateInput(
                                  s,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding * 4,
                                    vertical: kPadding),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(kRadius),
                                        bottomRight: Radius.circular(kRadius)),
                                    color: kPrimaryColor),
                                child: const Center(
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "Where should the link go? Type the full url, like this: https://twitter.com/twitch",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: kPadding),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          color: ktextfieldColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(kPadding * 1.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kRadius),
                                  color: kLightGreyColor.withOpacity(0.5)),
                              child: const Icon(
                                Icons.facebook,
                                color: kLightGreyColor,
                              )),
                          const SizedBox(width: kPadding),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: kPadding / 2),
                                Text(
                                  "https://facebook.com/jhonhiggins_",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kLightGreyColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget get setBannerImage {
    if (bannerImage == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DottedBorder(
          dashPattern: [6, 6],
          color: kWhiteColor,
          strokeWidth: 1,
          child: Container(
            width: AppConstants.mediaWidth(context),
            height: AppConstants.mediaHeight(context) * 0.30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: kBlackColor),
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          width: AppConstants.mediaWidth(context),
          height: AppConstants.mediaHeight(context) * 0.30,
          fit: BoxFit.fill,
          image: FileImage(File(bannerImage!.path)),
        ),
      );
    }
  }

  Widget get setProfileImage {
    if (profileImage == null) {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //     color: kDarkGreyColor,
            //     spreadRadius: 1,
            //     blurRadius: 10
            //   )
            // ],
            gradient: LinearGradient(colors: [
              kDarkGreyColor.withOpacity(0.8),
              kDarkGreyColor.withOpacity(0.8),
              Colors.transparent
            ])),
        child: Center(
          child: Icon(
            Icons.person_2_outlined,
            color: kWhiteColor,
          ),
        ),
      );
    } else {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              fit: BoxFit.fill, image: FileImage(File(profileImage!.path))),
        ),
      );
    }
  }
}
