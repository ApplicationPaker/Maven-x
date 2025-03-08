import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/add_bio_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepsCompletedScreen extends StatefulWidget {
  const StepsCompletedScreen({super.key});

  @override
  State<StepsCompletedScreen> createState() => _StepsCompletedScreenState();
}

class _StepsCompletedScreenState extends State<StepsCompletedScreen> {
  bool showLoading = false;

  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    getUserDetailCompletedFunc();

    super.initState();
  }

  void getUserDetailCompletedFunc() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userChannelGuidId = prefs.getString('userGuidId');
    // ignore: use_build_context_synchronously
    await Provider.of<AuthPro>(context, listen: false)
        .getCurrentUserDetailsFunc(context);

    // ignore: use_build_context_synchronously
    await Provider.of<AuthPro>(context, listen: false)
        .getUserChannelDetailsFunc(userChannelGuidId!, context);

    // ignore: use_build_context_synchronously
    await Provider.of<AuthPro>(context, listen: false)
        .getUserFavoriteGameslDetailsByUserGuidIdFunc(
            userChannelGuidId, context);
    // ignore: use_build_context_synchronously
    await Provider.of<AuthPro>(context, listen: false)
        .getUserChannelFollowingDetailsByUserGuidIdFunc(
            userChannelGuidId, context);
  }

  //* ------------------ VERIFY USER DETAILS ------------------

  Future<void> verifyUserDetails() async {
    setState(() {
      showLoading = true;
    });

    await Provider.of<AuthPro>(context, listen: false)
        .lastStepVerifyDetailsFunc(context);

    setState(() {
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
        widget: Consumer<AuthPro>(builder: (context, authValue, child) {
      return authValue.userCurrentDataIsLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: kPadding * 3),
                const Text(
                  "You are all set to go!",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: kWhiteColor),
                ),
                const SizedBox(height: kPadding),
                const Text(
                  "Here's a small overview of what you selected.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kLightGreyColor),
                ),
                const Center(
                  child: Divider(
                    color: kLightGreyColor,
                    height: 30,
                  ),
                ),
                const SizedBox(height: kPadding),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kRadius),
                      child: Image.network(
                        authValue.userDetailData!.user!.profileImageUrl
                            .toString(),
                        height: 40,
                        width: 37,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: kPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authValue.userDetailData!.user!.userName.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: kLightGreyColor),
                        ),
                        Text(
                          "DOB: ${authValue.userDetailData!.user!.birthday!.year}-${authValue.userDetailData!.user!.birthday!.month}-${authValue.userDetailData!.user!.birthday!.day}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: kPadding * 2),
                const Text(
                  "Pro VALORANT player",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: kWhiteColor),
                ),
                // <------------------------  SELECTED GAMES ------------------------>
                const SizedBox(height: kPadding * 3),
                const Text(
                  "Selected Games",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kLightGreyColor),
                ),
                const SizedBox(height: kPadding * 2),
                Consumer<AuthPro>(builder: (context, authValue, child) {
                  if (authValue.userFavoriteDataIsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (authValue
                      .userFavoriteGameData!.userFavouriteGames!.isNotEmpty) {
                    return Row(
                      children: List.generate(
                        authValue
                            .userFavoriteGameData!.userFavouriteGames!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding / 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kRadius),
                            child: Image.network(
                              authValue.userFavoriteGameData!
                                  .userFavouriteGames![index].imageUrl
                                  .toString(),
                              height: 70,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),

                // <------------------------  FOLLOWING PEOPLES ------------------------>
                const SizedBox(height: kPadding * 3),
                const Text(
                  "Followed People",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kLightGreyColor),
                ),
                const SizedBox(height: kPadding * 2),
                Consumer<AuthPro>(builder: (context, authValue, child) {
                  if (authValue.userChannelFollowingDataIsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (authValue.userChannelFollowingData!
                      .userChannelFollowings!.isNotEmpty) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                          authValue.userChannelFollowingData!
                              .userChannelFollowings!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPadding / 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kRadius),
                              child: Image.network(
                                authValue
                                    .userChannelFollowingData!
                                    .userChannelFollowings![index]
                                    .profileImageUrl
                                    .toString(),
                                height: 69,
                                width: 62,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),

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
                                    stepValue.goToStep(5);

                                    RouteNavigator.route(
                                        context, const AddBioStep());
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
                                   verifyUserDetails();
                                  },
                                  showLoading: showLoading,
                                  text: "Finish",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kPadding * 2),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Logout",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: kLightGreyColor)),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            );
    }));
  }
}
