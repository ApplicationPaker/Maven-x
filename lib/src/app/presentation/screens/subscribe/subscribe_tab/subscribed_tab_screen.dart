import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/subscribed_model.dart';

class SubscribedTabScreen extends StatelessWidget {
  const SubscribedTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;
   
    return Container(
      width: width,
      padding: kPadding.allEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: subscribedList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = subscribedList[index] ;
            
                  return Container(
                    margin: 20.bottomEdge,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
            
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image(
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              data.image
                            ),
                          ),
                        ),
            
                        20.sw,
            
                        Expanded(
                          child: Text(
                            data.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: kWhiteColor
                            ),
                          ),
                        ),
            
            
                        CustomButton(
                          width: width * 0.25,
                          onPressed: (){},
                          text: "Unsubscribe",
                          fontSize: 13,
                          negativeColor: true,
                        ),
            
                      ],
                    ),
                  ) ;
            
                }
            ),
          ),

        ],
      ),
    ) ;
  }
}
