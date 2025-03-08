import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

class StatisticsTabScreen extends StatelessWidget {
  const StatisticsTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Statistics",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: kWhiteColor
        ),
      ),
    ) ;
  }
}
