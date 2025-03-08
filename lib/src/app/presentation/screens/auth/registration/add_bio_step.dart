import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/stepper_widgets.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_favorite_person_step.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:provider/provider.dart';

class AddBioStep extends StatefulWidget {
  const AddBioStep({super.key});

  @override
  State<AddBioStep> createState() => _AddBioStepState();
}

class _AddBioStepState extends State<AddBioStep> {
  bool showLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController bioController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUserChannelDetailFunc();
  }

  void getUserChannelDetailFunc() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? userChannelGuidId = prefs.getString('userGuidId');

    // final bioPro = Provider.of<AuthPro>(context, listen: false);
    // bioPro.getUserChannelDetailsFunc(userChannelGuidId!, context).whenComplete(() {
    //     debugPrint("value: ${bioPro.userChannelData!.channel!.channelBio}");;
    // });
  }

  //* ------------------ UPDATE USER BIO ------------------

  Future<void> updateUserBio() async {
    setState(() {
      showLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      await Provider.of<AuthPro>(context, listen: false)
          .updateUserBioFunc(bioController.text, context);
    }

    setState(() {
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
      widget: Form(
        key: _formKey,
        child: Column(
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
              "Add your Bio",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor),
            ),
            const SizedBox(height: kPadding * 3),
            const Text(
              "Your date of birth will not be shown publicly.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: kLightGreyColor),
            ),
            const SizedBox(height: kPadding * 3),
            Consumer<AuthPro>(builder: (context, authValue, child) {
              if (authValue.userChannelDataIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // bioController.text =
                //     authValue.userChannelData!.channel!.channelBio == null
                //         ? ""
                //         : "";
                return TextFormField(
                  controller: bioController,
                  maxLines: 5,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kLightGreyColor),
                  decoration: InputDecoration(
                    hintText: "Write something...",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kLightGreyColor),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                        borderSide: const BorderSide(color: kGreyColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                        borderSide: const BorderSide(color: kGreyColor)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                        borderSide: const BorderSide(color: kRedColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                        borderSide: const BorderSide(color: kRedColor)),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Add Your Bio Details";
                    }
                    return null;
                  },
                );
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
                                stepValue.goToStep(4);
                                RouteNavigator.route(
                                    context, const SelectFavoritePersonStep());
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
                                // stepValue.nextStep();

                                // RouteNavigator.route(
                                //     context, const StepsCompletedScreen());
                                updateUserBio();
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
        ),
      ),
    );
  }
}
