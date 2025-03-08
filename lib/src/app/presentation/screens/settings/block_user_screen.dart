import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/custom_text_field.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/data/models/chat_model.dart';

class BlockUserScreen extends StatefulWidget {
  const BlockUserScreen({Key? key}) : super(key: key);

  @override
  State<BlockUserScreen> createState() => _BlockUserScreenState();
}

class _BlockUserScreenState extends State<BlockUserScreen> {

  final searchController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
   var width = AppConstants.mediaWidth(context) ;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: kWhiteColor,
        ),
        title: const Text(
          "Block User",
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: 16.allEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            Text(
              "Is someone giving you a hard time? Block them and they won't be able to interact with you.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: kSecondaryTextColor
              ),
            ),

            20.sh,

            CustomTextField(
                controller: searchController,
                fillColor: kGreyButtonColor.withOpacity(0.8),
            ),

            20.sh,


            Expanded(
              child: ListView.builder(
                  itemCount: chatList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    final e = chatList[index] ;

                    return Container(
                      margin: 25.bottomEdge,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  e.image
                                )
                            ),
                          ),

                          10.sw,

                          Expanded(
                              child: Text(
                                e.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: kWhiteColor
                                ),
                              )
                          ),

                          CustomButton(
                              width: width * 0.25,
                              onPressed: (){},
                              text: "Block"
                          ),

                        ],
                      ),
                    ) ;
                  }
              ),
            ),



          ],
        ),
      ),
    ) ;
  }


  @override
  void dispose() {
    searchController.dispose() ;
    // TODO: implement dispose
    super.dispose();
  }

}
