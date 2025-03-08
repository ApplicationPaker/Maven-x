import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import '../../../theme/color_theme.dart';
import '../../../utils/consts.dart';


class MavenXCustomBx extends StatelessWidget {
  final String prefixTitle ;
  final String suffixTitle ;
  final List<String> list ;
  final List<Color> colors;

  const MavenXCustomBx({Key? key, required this.prefixTitle, required this.suffixTitle, required this.list, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //core experience
          Container(
            padding: kPadding.allEdge,
            color: kDarkGreyColor,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  child: Text(
                    prefixTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kWhiteColor
                    ),
                  ),
                ),

                Text(
                  suffixTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: kDarkOrangeColor
                  ),
                )

              ],
            ),
          ),


          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colors
              ),
            ),
            padding: kPadding.allEdge,
            child: Column(
              children: List.generate(list.length, (index) {
                final e = list[index] ;

                return Padding(
                  padding: 10.bottomEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        e,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w300
                        ),
                      ),

                      const Divider(
                        color: kWhiteColor,
                        height: 25,
                        thickness: 0.3,
                      ),

                    ],
                  ),
                ) ;
              }),
            ),
          ),

        ],
      ),
    ) ;
  }
}
