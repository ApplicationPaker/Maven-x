import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/data/models/videos_model.dart';
class VideosTabScreen extends StatelessWidget {
  const VideosTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;
    var height = AppConstants.mediaHeight(context) ;
    
    return Container(
      width: width,
      padding: 10.topEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Expanded(
              child: ListView.builder(
                  itemCount: videosList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final data = videosList[index] ;

                    return Container(
                      margin: 20.bottomEdge,
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: height * 0.25,
                            child: Stack(
                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image(
                                      width: width,
                                      height: height,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        data.thumbnail
                                      )
                                  ),
                                ),

                                // view
                                Padding(
                                  padding: 0.customSymmetric(
                                      horizontal: 5,
                                      verticle: 5
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Align(
                                        alignment: Alignment.topRight,
                                        child: customRoundContainer(
                                            context: context,
                                            title: "${data.views} Views",
                                            color: Colors.black12.withOpacity(0.6),
                                            borderRadius: 4
                                        ),
                                      ),


                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          customRoundContainer(
                                              context: context,
                                              title: data.time,
                                              color: kWhiteColor.withOpacity(0.4),
                                              borderRadius: 10
                                          ),


                                          customRoundContainer(
                                              context: context,
                                              title: data.duration,
                                              color: kWhiteColor.withOpacity(0.4),
                                              borderRadius: 10
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          10.sh,

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    data.image
                                  ),
                                ),
                              ),

                              10.sw,

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    SizedBox(
                                      width: width,
                                      child: Text(
                                        data.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            color: kWhiteColor
                                        ),
                                      ),
                                    ),

                                    3.sh,

                                    SizedBox(
                                      width: width,
                                      child: Text(
                                        data.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            color: kSecondaryTextColor
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),



                            ],
                          ),

                        ],
                      ),
                    ) ;
                  }
              )
          )

        ],
      ),
    );
  }


  Widget customRoundContainer({
    required BuildContext context,
    required String title,
    required Color color,
    required double borderRadius
  }) {
    return FittedBox(
      child: Container(
          padding: 0.customSymmetric(horizontal: 8,verticle: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: color
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: kWhiteColor
              ),
            ),
          )
      ),
    ) ;
  }

}
