import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/Custom_toast_widget.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/stepper_widgets.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/add_bio_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_game_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/favorite_person_model.dart';
import 'package:provider/provider.dart';

class SelectFavoritePersonStep extends StatefulWidget {
  const SelectFavoritePersonStep({super.key});

  @override
  State<SelectFavoritePersonStep> createState() =>
      _SelectFavoritePersonStepState();
}

class _SelectFavoritePersonStepState extends State<SelectFavoritePersonStep> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AuthPro>(context, listen: false)
        .searchFavoritePersonFunc("", context);
  }

  bool showLoading = false;
  List<String> selectedPersonsIds = [];

  //* ------------------ UPDATE FAVORITE PERSON ------------------

  Future<void> updateFavoritePerson() async {
    setState(() {
      showLoading = true;
    });
    if (selectedPersonsIds.isEmpty) {
      showMyCustomSnackBar("Please Select At least 1 Person.", true, context);
    } else {
      await Provider.of<AuthPro>(context, listen: false)
          .updateFavoritPersonFunc(selectedPersonsIds, context);
    }

    setState(() {
      showLoading = false;
    });
  }

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
            "Follow your favorite person",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: kWhiteColor),
          ),
          const SizedBox(height: kPadding),
          TextField(
            controller: searchController,
            onChanged: (value) {
              selectedPersonsIds.clear();
              debugPrint("Value: $value");

              Provider.of<AuthPro>(context, listen: false)
                  .searchFavoritePersonFunc(value, context);
            },
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kLightGreyColor),
            decoration: InputDecoration(
              hintText: 'Search persons',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kLightGreyColor),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              prefixIcon: const Icon(
                Icons.search,
                color: kLightGreyColor,
              ),
            ),
          ),
          const SizedBox(height: kPadding * 3),
          Consumer<AuthPro>(
            builder: (context, authValue, child) {
              if (authValue.favoritePersonIsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authValue
                  .favoritePersonData!.userChannelFollowings!.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kPadding,
                      mainAxisSpacing: kPadding,
                      mainAxisExtent: 60),
                  itemCount: authValue
                      .favoritePersonData!.userChannelFollowings!.length,
                  itemBuilder: (context, index) {
                    return _buildFavoritePersonImage(
                        authValue.favoritePersonData!.userChannelFollowings!,
                        authValue.favoritePersonData!
                            .userChannelFollowings![index].profileImageUrl
                            .toString(),
                      
                        index);
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    "No Persons Available with this name.",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: kWhiteColor),
                  ),
                );
              }
            },
          ),
       
       
          const SizedBox(height: kPadding * 4),
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
                              stepValue.goToStep(3);
                              RouteNavigator.route(
                                  context, const SelectGameStep());
                            },
                            text: "Back",
                            negativeColor: true,
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
                              updateFavoritePerson();
                            },
                            showLoading: showLoading,
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
                        stepValue.goToStep(5);
                        RouteNavigator.route(context, const AddBioStep());
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

  Widget _buildFavoritePersonImage(
      List<UserChannelFollowing>? person, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!selectedPersonsIds.contains(person[index].userGuid.toString())) {
            selectedPersonsIds.add(person[index].userGuid!.toString());
          } else {
            selectedPersonsIds.remove(person[index].userGuid!.toString());
          }
        });
        debugPrint("selectedPersonsIds: $selectedPersonsIds");
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius),
          border: Border.all(
            color: selectedPersonsIds.contains(person![index].userGuid.toString())
                ? kPrimaryColor
                : Colors.transparent,
            width: 3,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius),
                  image: DecorationImage(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person[index].displayName.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kWhiteColor),
                      ),
                      const SizedBox(height: kPadding),
                      Text(
                        person[index].channelBio.toString() == "null"
                            ? "No Bio Set"
                            : person[index].channelBio.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: kLightGreyColor),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
