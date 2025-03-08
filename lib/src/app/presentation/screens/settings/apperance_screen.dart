import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

// ignore: must_be_immutable
class ApperanceScreen extends StatefulWidget {
  const ApperanceScreen({super.key});

  @override
  State<ApperanceScreen> createState() => _ApperanceScreenState();
}

class _ApperanceScreenState extends State<ApperanceScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // <------------------------  VERIFY PHONE NUMBER SECTION ------------------------>
      
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(kPadding * 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadius * 2),
                    color: kTertiaryColor),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Text(
                      "Verify Phone Number",
                      style: TextStyle(
                          fontSize: 14,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: kPadding * 2),
                    Text(
                      "Verification is required for safety & security reasons. Maven X will never contact you using your phone number.",
                      style: TextStyle(
                          fontSize: 13,
                          color: kLightGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: kPadding * 2),
      
                   
                  ],
                ),
              ),
            ),
            ],
        ),
      ),
    );
  }
}
