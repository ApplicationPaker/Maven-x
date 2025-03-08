import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class MavenXSubscriptionTab extends StatefulWidget {
  const MavenXSubscriptionTab({super.key});

  @override
  State<MavenXSubscriptionTab> createState() => _MavenXSubscriptionTabState();
}

class _MavenXSubscriptionTabState extends State<MavenXSubscriptionTab> {
  bool showLoading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  String selectcounrtyCode = '';
  final TextEditingController searchController = TextEditingController();
  bool stayLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // <------------------------  TRY PREMIUM SECTION ------------------------>

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Try premium Free",
                  style: TextStyle(
                      fontSize: 15,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height / 100 * 6,
                  child: CustomButton(
                      onPressed: () {},
                      showLoadingIndicator: true,
                      text: "Try Free 14 Days"),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 2),
            // <------------------------  CORE EXPERIEMCE SECTION ------------------------>
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kPadding * 2),
                      bottomRight: Radius.circular(kPadding * 2)),
                  color: kTertiaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kPadding * 2),
                            topRight: Radius.circular(kPadding * 2)),
                        color: kGreenColor,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            kGreyButtonColor.withOpacity(0.6),
                            kGreyButtonColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Core Experience",
                            style: TextStyle(
                                fontSize: 15,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Free / Active",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kPadding * 2, vertical: kPadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Only Record Games",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "2 minute clip upload limit",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Embedded Author Watermarks on all downloads",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Basic Maven X profiles & clip cards",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Basic Support",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kPadding * 2),
            // <------------------------  GOLD EXPERIEMCE SECTION ------------------------>
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kPadding * 2),
                      bottomRight: Radius.circular(kPadding * 2)),
                  color: kTertiaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kPadding * 2),
                            topRight: Radius.circular(kPadding * 2)),
                        color: kGreenColor,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            kGreyButtonColor.withOpacity(0.6),
                            kGreyButtonColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Gold Experience",
                            style: TextStyle(
                                fontSize: 15,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "\$9.99mo / \$95.88yr",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kPadding * 2, vertical: kPadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Record Anything, Not Just Games (Screen Recording)",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "10 minute clip upload limit",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Removable Author Watermarks on your clips",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Golden Profiles, Clip Cards & GIF Avatars",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Priority Chat Support",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Exclusive Founding Supporter & Gold MavenX",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "Founding Supporter Discord Role",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Divider(color: kGreyColor, height: 30),
                        Text(
                          "GIF Your Game Premium: Diamond",
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kPadding * 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Billing Frequency",
                  style: TextStyle(
                      fontSize: 13,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "\$9.99mo / \$95.88yr",
                  style: TextStyle(
                      fontSize: 15,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: stayLoggedIn,
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  onChanged: (value) {
                    setState(() {
                      stayLoggedIn = value;
                    });
                  },
                ),
                const Text(
                  "\$71.99/Annually",
                  style: TextStyle(
                      fontSize: 15,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
