import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/Custom_toast_widget.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/stepper_widgets.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_favorite_person_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/favorite_games_model.dart';
import 'package:provider/provider.dart';

class SelectGameStep extends StatefulWidget {
  const SelectGameStep({super.key});

  @override
  State<SelectGameStep> createState() => _SelectGameStepState();
}

class _SelectGameStepState extends State<SelectGameStep> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AuthPro>(context, listen: false)
        .searchFavoriteGameFunc(null, context);
  }

  List<int> selectedGamesIds = [];

  bool showLoading = false;

  //* ------------------ UPDATE FAVORITE GAME ------------------

  Future<void> updateFavoriteGame() async {
    setState(() {
      showLoading = true;
    });
    if (selectedGamesIds.isEmpty) {
      showMyCustomSnackBar("Please Select At least 1 game.", true, context);
    } else {
      await Provider.of<AuthPro>(context, listen: false)
          .updateFavoriteGameFunc(selectedGamesIds, context);
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
          "Follow at least 1 game you love",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: kWhiteColor),
        ),
        const SizedBox(height: kPadding),
        TextField(
          controller: searchController,
          onChanged: (value) {
            selectedGamesIds.clear();
            debugPrint("Value: $value");

            Provider.of<AuthPro>(context, listen: false)
                .searchFavoriteGameFunc(value, context);
          },
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: kLightGreyColor),
          decoration: InputDecoration(
            hintText: 'Search games',
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
        Consumer<AuthPro>(builder: (context, authValue, child) {
          if (authValue.favoriteGameIsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (authValue.favoriteGameData!.games!.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: kPadding,
                mainAxisSpacing: kPadding,
              ),
              itemCount: authValue.favoriteGameData!.games!.length,
              itemBuilder: (context, index) {
                return _buildGameImage(
                    authValue.favoriteGameData!.games!,
                    authValue.favoriteGameData!.games![index].gameImageUrl
                        .toString(),
                    index);
              },
            );
          } else {
            return const Center(
              child: Text(
                "No Game Availalble",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor),
              ),
            );
          }
        }),
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
                            stepValue.previousStep();
                            Navigator.pop(context);
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
                            updateFavoriteGame();
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
                      stepValue.goToStep(4);
                      RouteNavigator.route(
                          context, const SelectFavoritePersonStep());
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
    ));
  }

  Widget _buildGameImage(List<Game>? games, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!selectedGamesIds.contains(games[index].id)) {
            selectedGamesIds.add(games[index].id!);
          } else {
            selectedGamesIds.remove(games[index].id!);
          }
        });
        debugPrint("selectedGamesIds: $selectedGamesIds");
      },
      child: Container(
        height: 69,
        width: 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius),
          border: Border.all(
            color: selectedGamesIds.contains(games![index].id)
                ? kPrimaryColor
                : Colors.transparent,
            width: 3,
          ),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
