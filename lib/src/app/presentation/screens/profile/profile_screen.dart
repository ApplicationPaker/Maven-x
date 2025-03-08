import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/auth_pro.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/navigation_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/profile/appearance_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/blocked_channels_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/language_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/more_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_detail_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/widgets/profile_tile.dart';
import 'package:mavenx/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:mavenx/src/app/presentation/screens/subscribe/subscribe_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/assets.dart';
import '../settings/settings_tabview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          padding: 16.allEdge,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                30.sh,

                //Account text
                Text(
                  "Account",
                  textScaler: const TextScaler.linear(1.2),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),

                30.sh,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //name & channel
                    Consumer<AuthPro>(builder: (context, authValue, child) {
      return authValue.userCurrentDataIsLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :GestureDetector(
                      onTap: () {
                        const ProfileDetailScreen().push(context);
                      },
                      child: Container(
                        width: width,
                        padding: 12.allEdge,
                        decoration: BoxDecoration(
                            color: kTileColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                  image: AssetImage(Assets.images.appLogo)),
                            ),
                            20.sw,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width * 0.5,
                                  child: Text(
                                    "MY CHANNEL",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: kLightGreyColor,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ),
                                10.sh,
                                SizedBox(
                                  width: width * 0.5,
                                  child: Text(
                                 authValue.userDetailData!.user!.fullName.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kLightGreyColor,
                            ),
                          ],
                        ),
                      ),
                    );
}),
                    
                    25.sh,

                    //subscription and blocked channel
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfileTile(
                          onTap: () {
                            const SubscribeScreen().push(context);

                            // showModalBottomSheet(
                            //   backgroundColor: kBlackColor,
                            //     context: context,
                            //     isScrollControlled: true,
                            //     showDragHandle: true,
                            //     enableDrag: true,
                            //     useRootNavigator: false,
                            //     builder: (context) {
                            //       return subscriptionSheet(context) ;
                            //     }
                            // ) ;
                          },
                          icon: Assets.images.subscriptionPNG,
                          title: "Subscription",
                          bottomStraightBorder: true,
                          withBorder: true,
                        ),
                        ProfileTile(
                            onTap: () {
                              RouteNavigator.route(
                                  context, const BlockedChannelsScreen());
                            },
                            icon: Assets.images.blockedPNG,
                            title: "Blocked Channels",
                            topStraightBorder: true),
                      ],
                    ),

                    25.sh,

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfileTile(
                          onTap: () {
                            const SettingsTabView().push(context);
                          },
                          icon: Assets.images.settingPNG,
                          title: "Settings",
                          bottomStraightBorder: true,
                          withBorder: true,
                        ),
                        ProfileTile(
                          onTap: () {
                            const AppearanceScreen().push(context);
                          },
                          icon: Assets.images.appearancePNG,
                          title: "Appearance",
                          withBorder: true,
                        ),
                        ProfileTile(
                          onTap: () {
                            const LanguageScreen().push(context);
                          },
                          icon: Assets.images.languagePNG,
                          title: "Language",
                          withBorder: true,
                        ),
                        ProfileTile(
                          onTap: () {
                            const MoreScreen().push(context);
                          },
                          icon: Assets.images.morePNG,
                          title: "More",
                          topStraightBorder: true,
                        ),
                      ],
                    ),

                    25.sh,

                    ProfileTile(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

// < ---------------------  REMOVING STORED PREFS --------------------- >

                        prefs.remove('userFullName');
                        prefs.remove('username');
                        prefs.remove('userGuidId');
                        prefs.remove('role');
                        prefs.remove('token');
                     RouteNavigator.replacementroute(
              context, SplashScreen());
                      },
                      icon: Assets.images.logoutPNG,
                      title: "Log Out",
                      primaryColor: kDarkOrangeColor,
                      circularBorder: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*  Widget subscriptionSheet(BuildContext context) {

    var width = AppConstants.mediaWidth(context) ;
    var height = AppConstants.mediaHeight(context) ;

    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Container(
              width: width,
              padding: 14.allEdge,
              decoration: const BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // controller: controller,
                children: [


                  Text(
                      "COMPLETE PURCHASE",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kWhiteColor
                      ),
                  ),

                  30.sh,

                  SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  Assets.images.purchasePNG
                                )
                            ),
                          ),
                        ),

                        10.sh,

                        Text(
                          'Subscription to "Fazekayson"',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: kWhiteColor
                          ),
                        ),

                        20.sh,

                        Text(
                          "Recurring charge, starting today.",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kDarkGreyColor
                          ),
                        ),

                        5.sh,

                        Text(
                          "Cancel anytime on your Subscriptions page.",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: kDarkGreyColor
                          ),
                        ),

                        10.sh,

                        Text(
                          "Total including taxes",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: kWhiteColor
                          ),
                        ),

                        10.sh,

                        Text(
                          "\$4.99/month",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: kWhiteColor
                          ),
                        ),

                        const Divider(
                          height: 50,
                          thickness: 0.5,
                          color: kWhiteColor,
                        ),

                        Text(
                          "Select payment gateway",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w300
                          ),
                        ),

                        10.sh,


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            paymentCardWidget(
                                image: Assets.images.creditCardPNG,
                                title: 'Credit/Debit'
                            ),

                            paymentCardWidget(
                                image: Assets.images.madaPayPNG,
                                title: 'Madapay'
                            ),

                            paymentCardWidget(
                                image: Assets.images.stcPayPNG,
                                title: 'Stcpay'
                            ),

                            paymentCardWidget(
                                image: Assets.images.applePayPNG,
                                title: 'Apple pay',
                                zeroPadding: true
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ) ;
        }
    ) ;

  }*/
}
