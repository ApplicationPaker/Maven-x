import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_app_bar.dart';
import 'package:mavenx/src/app/presentation/screens/browse/tabs/browse_stream_tab.dart';
import 'package:mavenx/src/app/presentation/screens/browse/widgets/channel_item_widget.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';

class ChannelDetailsScreen extends StatefulWidget {
  final BrowseModel browseData;
  const ChannelDetailsScreen({
    super.key,
    required this.browseData,
  });

  @override
  State<ChannelDetailsScreen> createState() => _ChannelDetailsScreenState();
}

class _ChannelDetailsScreenState extends State<ChannelDetailsScreen>
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: customAppBar(isDetail: true, context),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kPadding * 2),

                  // <------------------------  CHANNEL DETAIL ------------------------>
                  ChannelItemWidget(size: size, browseData: widget.browseData),
                  // ---------------  ALL PRODUCTS ---------------

                  Column(
                    children: [
                      const SizedBox(height: kPadding * 2),
                      TabBar(
                        labelPadding: const EdgeInsets.all(kPadding),
                        controller: tabController,
                        indicatorWeight: 5,
                        indicatorColor: kPrimaryColor,
                        labelColor: kWhiteColor,
                        unselectedLabelColor: kWhiteColor,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            text: 'LIVE STREAMS',
                          ),
                          Tab(
                            text: 'RECENT BROADCASTS',
                          ),
                        ],
                      ),
                      const SizedBox(height: kPadding * 2),
                      SizedBox(
                        height: size.height / 100 * 55,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BrowseStreamTab(isStream: true,),
                            BrowseStreamTab(isStream: false,),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
