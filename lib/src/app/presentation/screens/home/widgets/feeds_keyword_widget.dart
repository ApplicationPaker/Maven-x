import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

SingleChildScrollView feedsKeywordWidget() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRadius / 2),
            color: kGreyButtonColor),
        child: Row(
          children: [
            Image.asset(
              Assets.images.valorantPNG,
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: kPadding / 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding),
              child: Text(
                "VALORANT",
                style: TextStyle(
                    fontSize: 13,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: kPadding),
      Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Container(
              padding: const EdgeInsets.all(kPadding / 2.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius / 2),
                  color: kGreyButtonColor),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding),
                child: Text(
                  "#edit",
                  style: TextStyle(
                      fontSize: 13,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        }),
      )
    ]),
  );
}
