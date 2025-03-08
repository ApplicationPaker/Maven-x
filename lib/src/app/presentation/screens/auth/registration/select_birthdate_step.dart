import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_black_screen.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/stepper_widgets.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_avatar_step.dart';
import 'package:mavenx/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectBirthdateStep extends StatefulWidget {
  const SelectBirthdateStep({Key? key}) : super(key: key);

  @override
  State<SelectBirthdateStep> createState() => _SelectBirthdateStepState();
}

class _SelectBirthdateStepState extends State<SelectBirthdateStep> {
  String selectedMonth = 'Month';
  String? selectedMonthConverted;
  String selectedDay = 'Day';
  String selectedYear = 'Year';
  List<String> monthArray = [
    'Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> dayArray = [
    'Day',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30'
  ];

  List<String> yearArray = ['Year'];

// Get the current year
  int currentYear = DateTime.now().year;

  addYear() {
    for (int year = 1990; year <= currentYear; year++) {
      yearArray.add(year.toString());
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    addYear();
    super.initState();
  }

  bool showLoading = false;

  //* ------------------ UPDATE BIRTHDAY ------------------

  Future<void> updateBirthday() async {
    setState(() {
      showLoading = true;
    });

    debugPrint("selectedMonth: $selectedMonth");
    debugPrint("selectedDay: $selectedDay");
    debugPrint("selectedYear: $selectedYear");

    await Provider.of<AuthPro>(context, listen: false).updateBirthdayFunc(
        selectedYear, selectedMonthConverted!, selectedDay, context);

    setState(() {
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomBlackScreen(
        widget: Consumer<AuthPro>(builder: (context, authValue, child) {
      if (authValue.userCurrentDataIsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        debugPrint(": ${authValue.userDetailData!.user!.birthday}");
        selectedDay = authValue.userDetailData!.user!.birthday!.day.toString();
        selectedYear =
            authValue.userDetailData!.user!.birthday!.year.toString();
        return Form(
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
                "When's your Birthday?",
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
              const SizedBox(height: kPadding * 6),
              // Dropdowns for selecting birthdate
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown(monthArray, value: selectedMonth,
                        onChanged: (value) {
                      setState(() {
                        int tempMonth = monthArray.indexOf(value!);
                        debugPrint("tempMonth: $tempMonth");
                        if (tempMonth <= 9) {
                          selectedMonthConverted = "0$tempMonth";
                        } else {
                          selectedMonthConverted = tempMonth.toString();
                        }
                        debugPrint(
                            "selectedMonthConverted: $selectedMonthConverted");
                      });
                    }),
                  ),
                  Expanded(
                    child: _buildDropdown(dayArray,
                        value: authValue.userDetailData!.user!.birthday!.day
                            .toString(), onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    }),
                  ),
                  Expanded(
                    child: _buildDropdown(yearArray,
                        value: authValue.userDetailData!.user!.birthday!.year
                            .toString(), onChanged: (value) {
                      setState(() {
                        selectedYear = value!;
                      });
                    }),
                  ),
                ],
              ),

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
                                
                                },
                                text: "Close",
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
                                  if (_formKey.currentState!.validate()) {
                                    updateBirthday();
                                  }
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
                          onPressed: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();

// < ---------------------  REMOVING STORED PREFS --------------------- >

                            prefs.remove('userFullName');
                            prefs.remove('username');
                            prefs.remove('userGuidId');
                            prefs.remove('role');
                            prefs.remove('token');
                            RouteNavigator.replacementroute(
                                context, const SplashScreen());
                          },
                          child: const Text("Logout",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: kLightGreyColor)),
                        ),
                        TextButton(
                          onPressed: () {
                            stepValue.goToStep(2);
                            RouteNavigator.route(
                                context, const SelectAvatarStep());
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
    }));
  }

  Widget _buildDropdown(
    List<String> items, {
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: 150,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius),
        color: Theme.of(context).cardColor,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kLightGreyColor),
        // underline: const SizedBox(),
        borderRadius: BorderRadius.circular(kRadius),
        focusColor: Colors.transparent,
        elevation: 1,
        isExpanded: true,
        dropdownColor: Theme.of(context).colorScheme.surface,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kLightGreyColor),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == "Month") {
            return "Select Month";
          } else if (value == "Day") {
            return "Select Day";
          } else if (value == "Year") {
            return "Select Year";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
