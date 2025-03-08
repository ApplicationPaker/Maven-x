import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/screens/profile/subscription/tabs/mavenx_subscribtion_tab.dart';
import 'package:mavenx/src/app/presentation/screens/profile/subscription/tabs/subscribed_tab.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class SubscriptionTavView extends StatefulWidget {
  const SubscriptionTavView({
    super.key,
  });

  @override
  State<SubscriptionTavView> createState() => _SubscriptionTavViewState();
}

class _SubscriptionTavViewState extends State<SubscriptionTavView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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

    return Scaffold(
      backgroundColor: kBlackColor,
        appBar: AppBar(
          backgroundColor: kBlackColor,
          elevation: 0,
          leading: Container(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: kWhiteColor,
                          )),
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
                    ],
                  ),
                  const SizedBox(height: kPadding * 2),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: kBlackColor,
                child: TabBar(
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
                      text: 'SUBSCRIBED',
                    ),
                    Tab(
                      text: 'SUBSCRIBERS',
                    ),
                    Tab(
                      text: 'MAVENX SUBS',
                    ),
                  ],
                ),
              ),

              // ---------------  ALL PRODUCTS ---------------
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SubscribedTab(),
                    SubscribedTab(isSubscriber: false,),
                   const  MavenXSubscriptionTab(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
