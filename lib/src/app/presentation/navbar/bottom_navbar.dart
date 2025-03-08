import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/screens/browse/browse_screen.dart';
import 'package:mavenx/src/app/presentation/screens/home/home_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int selectedTab = 0;
  BottomNavBar({
    Key? key,
    required this.selectedTab,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SalomonBottomBar(
          currentIndex: widget.selectedTab,
          selectedColorOpacity: 1,
          onTap: (position) => setState(() => widget.selectedTab = position),
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                  widget.selectedTab == 0
                      ? CupertinoIcons.house_fill
                      : CupertinoIcons.house,
                  color: widget.selectedTab == 0 ? kWhiteColor : kQuarterColor,
                  size: 20),
              title: const Text(
                "Home",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: Palette.themecolor,
              unselectedColor: kQuarterColor,
            ),

           
            /// Clips
            SalomonBottomBarItem(
              icon: Icon(
                  widget.selectedTab == 1
                      ? CupertinoIcons.play_circle_fill
                      : CupertinoIcons.play_circle,
                  color: widget.selectedTab == 1 ? kWhiteColor : kQuarterColor,
                  size: 20),
              title: const Text(
                "Clips",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: Palette.themecolor,
              unselectedColor: kQuarterColor,
            ),
 /// Compass
            SalomonBottomBarItem(
              icon: Icon(
                  widget.selectedTab == 2
                      ? CupertinoIcons.compass_fill
                      : CupertinoIcons.compass,
                  color: widget.selectedTab == 2 ? kWhiteColor : kQuarterColor,
                  size: 20),
              title: const Text(
                "Browse",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: Palette.themecolor,
              unselectedColor: kQuarterColor,
            ),

            /// profile
            SalomonBottomBarItem(
              icon: Icon(
                  widget.selectedTab == 3
                      ? CupertinoIcons.person_alt_circle_fill
                      : CupertinoIcons.person_alt_circle,
                  color: widget.selectedTab == 3 ? kWhiteColor : kQuarterColor,
                  size: 20),
              title: const Text(
                "Profile",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: Palette.themecolor,
              unselectedColor: kQuarterColor,
            ),
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: widget.selectedTab,
      children: const [
        HomeScreen(),
        Center(
          child: Text(
            "Coming Soon..",
            style: TextStyle(color: kWhiteColor),
          ),
        ),
        BrowseChannelScreen(),
       
        ProfileScreen()
      ],
    );
  }
}
