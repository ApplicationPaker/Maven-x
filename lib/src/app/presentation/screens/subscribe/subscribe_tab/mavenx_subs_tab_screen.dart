import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/screens/subscribe/widgets/mavenx_custum_box.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
class MavenXSubsTabScreen extends StatefulWidget {
  const MavenXSubsTabScreen({Key? key}) : super(key: key);

  @override
  State<MavenXSubsTabScreen> createState() => _MavenXSubsTabScreenState();
}

class _MavenXSubsTabScreenState extends State<MavenXSubsTabScreen> {

  List<String> list1 = [
    "Only Record Games",
    "2 minute clip upload limit",
    "Embedded Author Watermarks on all downloads",
    "Basic Maven X profiles & clip cards",
    "Basic Support"
  ] ;

  List<String> list2 = [
    "Record Anything, Not Just Games (Screen Recording)",
    "10 minute clip upload limit",
    "Removable Author Watermarks on your clips",
    "Golden Profiles, Clip Cards & GIF Avatars",
    "Priority Chat Support",
    "Exclusive Founding Supporter & Gold MavenX",
    "Founding Supporter Discord Role",
    "GIF Your Game Premium: Diamond",
  ] ;

  bool inOn = false ;


  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;
    var height = AppConstants.mediaHeight(context) ;

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: height * 0.06,
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                "Billing Frequency",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kWhiteColor
                ),
              ),


              10.sw,

              Text(
                "\$9.99/Monthly",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kDarkOrangeColor
                ),
              ),

              Padding(
                padding: 10.horizontalEdge,
                child: Switch(
                    value: inOn,
                    activeColor: kDarkOrangeColor,
                    onChanged: (bool? value) {
                      setState(() {
                        inOn = value! ;
                      });
                    }
                ),
              ),

              Text(
                "\$71.99/Annually",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kWhiteColor
                ),
              ),


            ],
          ),
        ),
      ),

      body: Container(
        width: width,
        padding: kPadding.allEdge,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              //try premium free
              SizedBox(
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Text(
                        "Try premium free",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: kWhiteColor
                        ),
                      ),
                    ),

                    CustomButton(
                        width: width * 0.32,
                        onPressed: (){},
                        text: "Try Free 14 Days",
                        fontSize: 12,
                    ),

                  ],
                ),
              ),

              20.sh,

              MavenXCustomBx(
                  prefixTitle: "Core Experience",
                  suffixTitle: "Free / Active",
                  list: list1,
                  colors: const [
                    Colors.transparent,
                    kDarkGreyColor
                  ]
              ),

              20.sh,

              MavenXCustomBx(
                  prefixTitle: "Gold Experience",
                  suffixTitle: "\$9.99mo / \$95.88yr",
                  list: list2,
                  colors: const [
                    kDarkGreyColor,
                    Colors.transparent
                  ]
              ),




            ],
          ),
        ),
      ),
    ) ;
  }
}
