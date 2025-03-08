import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

import '../../../utils/assets.dart';

class AboutTabScreen extends StatelessWidget {
  const AboutTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Align(
      alignment: Alignment.topCenter,
      child: FittedBox(
        child: Container(
          margin: 30.topEdge,
          width: AppConstants.mediaWidth(context),
          padding: 10.allEdge,
          decoration: BoxDecoration(
            color: kDarkGreyColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    "About ShahZaM",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: kWhiteColor
                    ),
                  ),

                  const Spacer(),

                  socialMediaWidget(
                      onTap: (){},
                      image: Assets.images.twitterPNG
                  ),

                  socialMediaWidget(
                      onTap: (){},
                      image: Assets.images.instagramPNG
                  ),

                  socialMediaWidget(
                      onTap: (){},
                      image: Assets.images.youtubePNG
                  ),

                  socialMediaWidget(
                      onTap: (){},
                      image: Assets.images.facebookPNG,
                      zeroPadding: true
                  ),

                ],
              ),

              20.sh,

              Text(
                "9.9 M Followers \t\t\t\t 743 Following",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: kRedColor
                ),
              ),

              20.sh,

              Text(
                "THE BEST AT ABSOLUTELY EVERYTHING. THE JUICER LEADER OF THE JUICERS.",
                textScaler: const TextScaler.linear(0.8),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w300
                ),
              ),

              20.sh,
            ],
          ),
        ),
      ),
    ) ;
  }


  Widget socialMediaWidget({required VoidCallback onTap, required String image, bool? zeroPadding}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: zeroPadding == true ? 0.allEdge : 10.rightEdge,
        child: Image(
            height: 20,
            width: 20,
            fit: BoxFit.fill,
            image: AssetImage(
                image
            )
        ),
      ),
    ) ;
  }


}



// https://www.figma.com/file/ZQtVBdUfQaDDRCN1QGxD1C/Untitled?type=design&node-id=1-10488&mode=design&t=KtNkv5hz1kfb63up-0