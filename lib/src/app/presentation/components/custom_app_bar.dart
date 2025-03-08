
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mavenx/src/app/presentation/config/extensions/navigation_extension.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/notifications/notification_screen.dart';
import 'package:mavenx/src/app/presentation/screens/search/search_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:badges/badges.dart' as badges;

PreferredSize customAppBar(
  BuildContext context, {
  bool isDetail = false,

}) {

  TextEditingController searchController = TextEditingController();
  String searchText = "";


  return PreferredSize(
    preferredSize: const Size(double.infinity, 88),
    child:AppBar(
          backgroundColor: kBlackColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: Column(
                children: [
                  Row(
                    children: [
                    isDetail?   IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pop(context);
                            searchText;
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: kWhiteColor,
                          )): const SizedBox(),
                      Expanded(
                        child: TextField(
                          onTap: (){
                                const SearchScreen().push(context) ;
                          },
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
                            // setState(() {
                              searchText = searchController.text;
                            // });
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
                  
                ],
              ),
            ),
          ),
        ),
        
    
    
    
    );
    
    
    
    }