import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/payment_methods/payment_methods_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/blocked_channels_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/subscription/subscription_tab_view.dart';
import 'package:mavenx/src/app/presentation/screens/settings/modal_bottom_sheet/no_internet_bottom_sheet.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/accounts_model.dart';

class ConnectingAccountsTab extends StatefulWidget {
  const ConnectingAccountsTab({super.key});

  @override
  State<ConnectingAccountsTab> createState() => _ConnectingAccountsTabState();
}

class _ConnectingAccountsTabState extends State<ConnectingAccountsTab> {
  bool showLoading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  String selectcounrtyCode = '';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // <------------------------  RECOMMENDED CONNECTIONS SECTION ------------------------>
            const Text(
              "RECOMMENDED CONNECTIONS",
              style: TextStyle(
                  fontSize: 13,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: kPadding * 2),
            const Text(
              "Manage your connected accounts and services",
              style: TextStyle(
                  fontSize: 13,
                  color: kLightGreyColor,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 2),

            SizedBox(
              height: size.height / 100 * 6,
              child: CustomButton(
                  onPressed: () {
                    RouteNavigator.route(
                        context, const BlockedChannelsScreen());
                  },
                  showLoadingIndicator: true,
                  text: "Blocked Channels"),
            ),
            const SizedBox(height: kPadding * 2),

            SizedBox(
              height: size.height / 100 * 6,
              child: CustomButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (conext) {
                          return SizedBox(
                              height: size.height / 100 * 60,
                              child: const PaymentMethodsScreen());
                        });
                  },
                  showLoadingIndicator: true,
                  text: "Payment Methods"),
            ),

            const SizedBox(height: kPadding * 2),

            SizedBox(
              height: size.height / 100 * 6,
              child: CustomButton(
                  onPressed: () {
                    RouteNavigator.route(context, const SubscriptionTavView());
                  },
                  showLoadingIndicator: true,
                  text: "Subscriptions"),
            ),
            const SizedBox(height: kPadding * 2),
            Column(
              children: List.generate(accountsConnectModel.length, (index) {
                var accountData = accountsConnectModel[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadius * 2),
                        color: kTertiaryColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          accountData.platformImg,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: kPadding * 2),
                        Text(
                          accountData.title,
                          style: const TextStyle(
                              fontSize: 14,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: size.height / 100 * 6,
                          child: CustomButton(
                               width: 90,
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (conext) {
                                      return SizedBox(
                                          height: size.height / 100 * 40,
                                          child: const NoInternetBottomSheet());
                                    });
                              },
                              showLoadingIndicator: true,
                              text: "Connect"),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
