import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/browse/channel_details_screen.dart';
import 'package:mavenx/src/app/presentation/screens/browse/tabs/live_channels_tab.dart';
import 'package:mavenx/src/app/presentation/screens/browse/widgets/channel_item_widget.dart';
import 'package:mavenx/src/app/presentation/screens/notifications/notification_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';
import 'package:badges/badges.dart' as badges;

class BrowseChannelScreen extends StatefulWidget {
  const BrowseChannelScreen({
    super.key,
  });

  @override
  State<BrowseChannelScreen> createState() => _BrowseChannelScreenState();
}

class _BrowseChannelScreenState extends State<BrowseChannelScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  TextEditingController searchController = TextEditingController();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: AppBar(
          backgroundColor: kBlackColor,
          elevation: 0,
          leading: Container(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(
                              color: kQuarterColor, fontSize: 17),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kTertiaryColor,
                            prefixIcon:
                                const Icon(Icons.search, color: kQuarterColor),
                            hintText: "Search",
                            hintStyle: const TextStyle(
                                color: kQuarterColor, fontSize: 17),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(kRadius),
                                borderSide:
                                    const BorderSide(color: kTertiaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(kRadius),
                                borderSide:
                                    const BorderSide(color: kTertiaryColor)),
                            contentPadding: const EdgeInsets.all(kPadding / 2),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchText = searchController.text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: kPadding / 2),
                        child: InkWell(
                          onTap: () {
                            RouteNavigator.route(
                                context, const NotificationScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(kPadding),
                            decoration: BoxDecoration(
                                color: kTertiaryColor,
                                borderRadius: BorderRadius.circular(kRadius)),
                            child: badges.Badge(
                              badgeStyle: const badges.BadgeStyle(
                                  padding: EdgeInsets.all(3)),
                              badgeContent: const Text(
                                '23',
                                style: TextStyle(
                                  color: kWhiteColor,
                                ),
                              ),
                              child: SvgPicture.asset(
                                Assets.svg.notificationsSVG,
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kPadding * 2),
                  TabBar(
                    labelPadding: const EdgeInsets.all(0),
                    controller: tabController,
                    indicatorWeight: 5,
                    indicatorColor: kPrimaryColor,
                    labelColor: kWhiteColor,
                    unselectedLabelColor: kWhiteColor,
                    labelStyle: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                        text: 'CATEGORIES',
                      ),
                      Tab(
                        text: 'LIVE CHANNELS',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kPadding * 2),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: List.generate(browseModel.length, (index) {
                            var browseData = browseModel[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kPadding),
                              child: InkWell(
                                onTap: () {
                                  RouteNavigator.route(
                                      context,
                                      ChannelDetailsScreen(
                                        browseData: browseData,
                                      ));
                                },
                                child: ChannelItemWidget(
                                    size: size, browseData: browseData),
                              ),
                            );
                          }),
                        ),
                      ),
                     
                     
                      const LiveChannelsTab()
                    ],
                  ),
                ),
            
              ],
            ),
          ),
        ));
  }
}
