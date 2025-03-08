import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: AppBar(
          backgroundColor: kBlackColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "NOTIFICATIONS",
            style: TextStyle(
                fontSize: 15, color: kWhiteColor, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kPadding * 2),
                  Column(
                    children: List.generate(15, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: kPadding),
                        child: Container(
                          padding: const EdgeInsets.all(kPadding * 1.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kRadius),
                              color: kTertiaryColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(kRadius),
                                child: Image.network(
                                  "https://th.bing.com/th/id/R.35720bbf29a0f0f1d48195bafdbedf7a?rik=1ArMFF%2fGA8AK1g&riu=http%3a%2f%2fshmector.com%2f_ph%2f13%2f188552034.png&ehk=4W3VAJ3Rgszg4unVrkViPToNE%2b15%2bt3SxRm%2b2VYCdIk%3d&risl=&pid=ImgRaw&r=0",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: kPadding * 2),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "02:30 PM",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Apexplayer is now following you!",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                             
                              index == 0
                                  ? const Icon(
                                      Icons.circle,
                                      color: kPrimaryColor,
                                      size: 20,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


