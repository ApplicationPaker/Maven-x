import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/screens/settings/tabs/conntecting_accounts_tab.dart';
import 'package:mavenx/src/app/presentation/screens/settings/tabs/personal_info_tab.dart';
import 'package:mavenx/src/app/presentation/screens/settings/tabs/privacy_tab.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class SettingsTabView extends StatefulWidget {
  const SettingsTabView({
    super.key,
  });

  @override
  State<SettingsTabView> createState() => _SettingsTabViewState();
}

class _SettingsTabViewState extends State<SettingsTabView>
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        key: _key,
        backgroundColor: kBlackColor,
        drawer: const SafeArea(
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kTertiaryColor,
          elevation: 0,
          leading: Container(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPadding * 2, vertical: kPadding / 2),
              child: Row(
                children: [
                  Image.asset(
                    Assets.images.appTransparentLogo,
                    height: 34,
                    width: 27,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: kPadding),
                  IconButton(
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.short_text,
                        color: kWhiteColor,
                        size: 35,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: kWhiteColor,
                        size: 30,
                      )),
                  const SizedBox(width: kPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kRadius),
                    child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/bfae/bd3a/ff237d8857cf983061d1c351cd2400a9?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nlpsS9ZCx4y7BDc3QKGkLgt~IaExXpeTzMXRsAxhWSXxYlnVjHDyHk5WOIInYgcadshudKpNLoJLw99WXbn6XyTt-Z7nUwo9Dja2UdERhhH1kzzUS2qCS-BraYDJNxn-yNz8mBQs6YCEpMl5Hr-KKaoQArO~IkBoNt~-jlpQCkDdSiaYYiJiPmbtGxoLXcTsPbOFBZcMIIG-YllrP94mdlqaOrQ99dBwG9CGWH-suuRujjmabkbj47qMwAzSiv5IZF2kjnczSGycXdDjzaYHyRolhfrjJKCrFWBGSQ-2BWJ9Ra02WvYcXvr5Y13X0A9J-KBI77hqUqNWBxdQbehdZA__",
                      height: 34,
                      width: 34,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                labelPadding: const EdgeInsets.all(0),
                controller: tabController,
                indicatorWeight: 5,
                indicatorColor: kPrimaryColor,
                labelColor: kWhiteColor,
                unselectedLabelColor: kWhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'PERSONAL INFO',
                  ),
                  Tab(
                    text: 'ACCOUNTS',
                  ),
                  Tab(
                    text: 'PRIVACY',
                  ),
                ],
              ),
              SizedBox(height: size.height / 100 * 2),
              // ---------------  ALL PRODUCTS ---------------
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    PersonalInfoTab(),
                    ConnectingAccountsTab(),
                    PrivacyTab(),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 100 * 2,
              ),
            ],
          ),
        ));
  }
}
