import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/stepper_widgets.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_birthdate_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_game_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:provider/provider.dart';

class SelectAvatarStep extends StatefulWidget {
  const SelectAvatarStep({super.key});

  @override
  State<SelectAvatarStep> createState() => _SelectAvatarStepState();
}

class _SelectAvatarStepState extends State<SelectAvatarStep> {
  bool showLoading = false;
  int selectedAvatarIndex = -1; // Initialize with -1 to indicate no selection
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<StepperPro>(builder: (context, stepValue, child) {
            return StepIndicator(
              currentStep: stepValue.currentStep,
              totalSteps: 5,
            );
          }),
          const SizedBox(height: kPadding * 3),
          const Text(
            "Select your Avatar",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: kWhiteColor),
          ),
          const SizedBox(height: kPadding * 3),
          // here
          _buildAvatarSelectionRows(),
          const SizedBox(height: kPadding * 6),
          Consumer<StepperPro>(builder: (context, stepValue, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: kPadding),
                        child: SizedBox(
                          height: size.height / 100 * 6,
                          child: CustomButton(
                            onPressed: () async {
                               stepValue.goToStep(1);
                                RouteNavigator.replacementroute(
                                    context, const SelectBirthdateStep());
                            },
                            text: "Back",
                            negativeColor: true,
                            showLoading: showLoading,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: kPadding),
                        child: SizedBox(
                          height: size.height / 100 * 6,
                          child: CustomButton(
                            onPressed: () {
                              stepValue.nextStep();
                              RouteNavigator.route(context, const SelectGameStep());
                            },
                            showLoadingIndicator: true,
                            text: "Continue",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: kPadding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Logout",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: kLightGreyColor)),
              ),
              TextButton(
                onPressed: () {

                   stepValue.goToStep(3);
                            RouteNavigator.route(
                                context, const SelectGameStep());
                },
                child: const Text("Skip",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kGreyColor)),
              ),
            ],
          ),
       
              ],
            );
          }),
          ],
      ),
    );
  }

  List<String> avatarImages = [
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
  ];
  Widget _buildAvatarSelectionRows() {
    return Column(
      children: [
        _buildAvatarRow(0),
        const SizedBox(height: kPadding),
        _buildAvatarRow(4),
        const SizedBox(height: kPadding),
        _buildAvatarRow(8),
      ],
    );
  }

  Widget _buildAvatarRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAvatarImage(avatarImages[startIndex], startIndex),
        _buildAvatarImage(avatarImages[startIndex + 1], startIndex + 1),
        _buildAvatarImage(avatarImages[startIndex + 2], startIndex + 2),
        _buildAvatarImage(avatarImages[startIndex + 3], startIndex + 3),
      ],
    );
  }

  Widget _buildAvatarImage(String imagePath, int index) {
    bool isSelected = index == selectedAvatarIndex;

    return GestureDetector(
      onTap: () async {
        if (index == 0) {
          // Handle user's image selection
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            setState(() {
              selectedAvatarIndex = index;
              avatarImages[index] =
                  pickedFile.path; // Update the avatar image path
            });
          }
        } else {
          setState(() {
            selectedAvatarIndex = index;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 100 * 15,
        height: MediaQuery.of(context).size.height / 100 * 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius),
          border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            width: 3,
          ),
        ),
        child: index == 0 && avatarImages[index].isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(kRadius),
                child: Image.file(
                  File(avatarImages[index]),
                  fit: BoxFit.cover,
                ),
              )
            : Image.network(
                avatarImages[index],
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
