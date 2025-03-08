import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

// ignore: must_be_immutable
class SubscribedTab extends StatefulWidget {
  SubscribedTab({
    super.key,
    this.isSubscriber = false,
  });
  bool isSubscriber;
  @override
  State<SubscribedTab> createState() => _SubscribedTabState();
}

class _SubscribedTabState extends State<SubscribedTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(kRadius),
                                child: Image.network(
                                  "https://www.figma.com/file/ZQtVBdUfQaDDRCN1QGxD1C/image/71f8a1ba4341094db9a4fdb355b7a018beaa2528",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: kPadding * 2),
                              const Text(
                                "Apexplayer",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                            widget.isSubscriber == true?  const SizedBox(): CustomButton(
                                onPressed: () {},
                                text: "Unsubscribe",
                                negativeColor: true,
                              ),
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
