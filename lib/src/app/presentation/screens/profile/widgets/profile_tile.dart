import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import '../../../theme/color_theme.dart';

class ProfileTile extends StatelessWidget {
  final VoidCallback onTap ;
  final String icon ;
  final String title ;
  final bool? topStraightBorder ;
  final bool? bottomStraightBorder ;
  final bool? circularBorder ;
  final bool? withBorder ;
  final Color? primaryColor ;

  const ProfileTile({Key? key, required this.onTap, required this.icon, required this.title, this.topStraightBorder, this.bottomStraightBorder, this.withBorder, this.circularBorder, this.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            padding: 14.allEdge,
            decoration: BoxDecoration(
                borderRadius: getBorder(
                    topStraightBorder: topStraightBorder,
                    bottomStraightBorder: bottomStraightBorder,
                    circularBorder: circularBorder
                ),
                color: kTileColor
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                ImageIcon(
                  AssetImage(icon),
                  color: primaryColor ?? kWhiteColor,
                  size: 25,
                ),

                15.sw,

                Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: primaryColor ?? kWhiteColor
                      ),
                    )
                ),

                Padding(
                  padding: 0.rightEdge,
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: kLightGreyColor,
                    size: 20,
                  ),
                ),

              ],
            ),
          ),
        ),

        Visibility(
          visible: withBorder == true,
          child: Divider(
            color: kLightGreyColor.withOpacity(0.7),
            thickness: 0.5,
            height: 0,
          ),
        ),

      ],
    ) ;
  }


  BorderRadiusGeometry getBorder({bool? topStraightBorder, bool? bottomStraightBorder, bool? circularBorder}) {

    if(topStraightBorder == true) {

      return const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
      ) ;

    }
    else if(bottomStraightBorder == true){
      return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
      ) ;
    }
    else if(circularBorder == true) {
      return BorderRadius.circular(10) ;
    }
    else {
      return BorderRadius.circular(0) ;
    }

  }

}
