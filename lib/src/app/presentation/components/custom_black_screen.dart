// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

// ignore: must_be_immutable
class CustomBlackScreen extends StatelessWidget {
  final Widget? widget;

  bool? isLogoShow;
  CustomBlackScreen({
    Key? key,
    this.widget,
    this.isLogoShow = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLogoShow == true
                    ? Image.asset(
                        Assets.images.mavenxHorizontalLogoPNG,
                        width: size.width / 100 * 70,
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(kPadding * 2.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kBlackColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(kRadius),
                      boxShadow: [
                        BoxShadow(
                            color: kBlackColor.withOpacity(0.7), blurRadius: 1)
                      ],
                    ),
                    child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(kPadding * 3),
                        decoration: BoxDecoration(
                          color: kTertiaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(kRadius),
                          boxShadow: [
                            BoxShadow(
                              color: kBlackColor.withOpacity(0.2),
                              blurRadius: 10.0,
                              offset: const Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                        child: widget ?? const SizedBox()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
