import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_text_field.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/data/models/profile_chat_model.dart';

class ChatTabScreen extends StatefulWidget {
  const ChatTabScreen({Key? key}) : super(key: key);

  @override
  State<ChatTabScreen> createState() => _ChatTabScreenState();
}

class _ChatTabScreenState extends State<ChatTabScreen> {

  final _controller = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width ;

    return Container(
      // height: AppConstants.mediaHeight(context),
      padding: 10.verticalEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    profileChatList.length,
                    (index){
                      final data = profileChatList[index] ;

                      return Container(
                        margin: 10.bottomEdge,
                        width: width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
              
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image(
                                height: 30,
                                width: 30,
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  data.image
                                ),
                              ),
                            ),
              
                            10.sw,
              
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Text(
                              "${data.userName} : ",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: data.nameColor
                              ),
                            ),

                                  Expanded(
                                    child: Text(
                                      data.chat,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          color: kWhiteColor
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
              
                          ],
                        ),
                      ) ;
                    }
                ),
              ),
            ),
          ),


          CustomTextField(
              controller: _controller,
              fillColor: kTextFieldColor,
              prefixIcon: const Icon(
                Icons.emoji_emotions_outlined,
                color: kWhiteColor,
              ),
              hint: "Send a message",
              suffixIcon: const Icon(
                Icons.send,
                color: kRedColor,
              ),
          )

        ],
      ),
    ) ;
  }


  @override
  void dispose() {
    _controller.dispose() ;
    // TODO: implement dispose
    super.dispose();
  }

}