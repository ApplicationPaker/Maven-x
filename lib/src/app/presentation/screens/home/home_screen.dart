import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/dashboard_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_app_bar.dart';
import 'package:mavenx/src/app/presentation/navbar/bottom_navbar.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/browse/widgets/broadcast_item_widget.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    final dashboardPro = Provider.of<DashboardPro>(context, listen: false);
    dashboardPro.fetchTopDashboardGamesFunc(context);
    dashboardPro.fetchTopDashboardStreamFunc(context);
    dashboardPro.fetchPreferenceBasedDashboardStreamFunc(context);
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  TextEditingController searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: customAppBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: Column(
                children: [
                  // ---------------  LIVE STREAM ---------------
                  Consumer<DashboardPro>(builder: (context, gameValue, child) {
                    if (gameValue.topDashboardStreamDataIsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (gameValue
                        .topDashboardStreamData != null) {
                      return BroadcastItemWidget(
                        streamData:
                            gameValue.topDashboardStreamData!.channels!.first,
                        browseData: browseModel.first,
                        isStreaming: true,
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://cdni.iconscout.com/illustration/premium/thumb/boy-showing-folder-with-no-data-10962340-8881964.png",
                            fit: BoxFit.cover,
                            height: 250,
                            width: 250,
                          ),
                          const Text(
                            "No Live Stream Available",
                            style: TextStyle(
                                fontSize: 15,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      );
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Browse",
                          style: TextStyle(
                              fontSize: 15,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            RouteNavigator.route(
                                context, BottomNavBar(selectedTab: 2));
                          },
                          child: const Text(
                            "VIEW ALL",
                            style: TextStyle(
                                fontSize: 13,
                                color: kLightGreyColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // // ---------------  Channels ---------------

                  Consumer<DashboardPro>(builder: (context, gameValue, child) {
                    if (gameValue.topDashboardGamesDataIsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (gameValue.topDashboardGamesData!
                        .topGamesForDashboard!.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: kPadding,
                                mainAxisSpacing: kPadding,
                                mainAxisExtent: 200),
                        itemCount: gameValue.topDashboardGamesData!
                                    .topGamesForDashboard!.length >
                                4
                            ? 4
                            : gameValue.topDashboardGamesData!
                                .topGamesForDashboard!.length,
                        itemBuilder: (context, index) {
                          final gameData = gameValue.topDashboardGamesData!
                              .topGamesForDashboard![index];
                          return InkWell(
                            onTap: () {
                              // RouteNavigator.route(
                              //     context,
                              //     ChannelDetailsScreen(
                              //       browseData: browseData,
                              //     ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kRadius),
                              child: Image.network(
                                gameData.gameImageUrl.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Text("No data");
                    }
                  }),

                  const SizedBox(
                    height: kPadding,
                  ),

                  // --------------- MULTIPLE LIVE STREAM ---------------
                  Consumer<DashboardPro>(builder: (context, gameValue, child) {
                    if (gameValue.preferenceBasedDashboardStreamDataIsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (gameValue.preferenceBasedDashboardStreamData!
                        .channels!.isNotEmpty) {
                      return Column(
                        children: List.generate(
                            gameValue.preferenceBasedDashboardStreamData!
                                .channels!.length, (index) {
                          return BroadcastItemWidget(
                            streamData: gameValue
                                .preferenceBasedDashboardStreamData!
                                .channels![index],
                            browseData: browseModel.first,
                            isStreaming: true,
                          );
                        }),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://cdni.iconscout.com/illustration/premium/thumb/boy-showing-folder-with-no-data-10962340-8881964.png",
                            fit: BoxFit.cover,
                            height: 250,
                            width: 250,
                          ),
                          const Text(
                            "No Prefered Based Stream Available",
                            style: TextStyle(
                                fontSize: 15,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      );
                    }
                  }),
                  const SizedBox(height: kPadding * 2),
                ],
              ),
            ),
          ),
        ));
  }
}
