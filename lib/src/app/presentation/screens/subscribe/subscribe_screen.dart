import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/screens/subscribe/subscribe_tab/mavenx_subs_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/subscribe/subscribe_tab/subscribed_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/subscribe/subscribe_tab/subscribers_tab_screen.dart';


import '../../components/custom_text_field.dart';
import '../../theme/color_theme.dart';
import '../../utils/consts.dart';


class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({Key? key}) : super(key: key);

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> with SingleTickerProviderStateMixin{

  final searchController = TextEditingController() ;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var width = AppConstants.mediaWidth(context) ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        elevation: 0,
        // leading:
        // Icon(
        //   Icons.arrow_back_ios,
        //   color: kWhiteColor,
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: (kPadding * 2).horizontalEdge,
            child: Column(
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    InkWell(
                      onTap: (){
                        Navigator.pop(context) ;
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: kWhiteColor,
                      ),
                    ),
                    
                    10.sw,

                    Expanded(
                      child: CustomTextField(
                        controller: searchController,
                      ),
                    ),
                    
                    
                  ],
                ),

                (kPadding * 2).sh,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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

                    const Divider(
                      height: 0,
                      thickness: 0.5,
                      color: kWhiteColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: 10.allEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SubscribedTabScreen(),
                  SubscriberTabScreen(),
                  MavenXSubsTabScreen(),
                ],
              ),
            ),

          ],
        ),
      ),
    ) ;
  }


  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

}


