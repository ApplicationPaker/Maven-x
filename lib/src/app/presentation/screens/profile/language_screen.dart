import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';

enum LanguageType {

  english, arbi ;

}

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  LanguageType languageType = LanguageType.english ;

  @override
  Widget build(BuildContext context) {
    double width = AppConstants.mediaWidth(context) ;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: ()=> Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Language",
          style: TextStyle(
              color: kWhiteColor
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: 12.allEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            30.sh,

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kTileColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  buildRow(
                      onTap: (){
                        setState(() {
                          languageType = LanguageType.english ;
                        });
                      },
                      title: "English",
                      showCheck: languageType == LanguageType.english
                  ),

                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: kWhiteColor,
                  ),

                  buildRow(
                      onTap: (){
                        setState(() {
                          languageType = LanguageType.arbi ;
                        });
                      },
                      title: "عربی",
                      showCheck: languageType == LanguageType.arbi
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    ) ;
  }

  Widget buildRow({required VoidCallback onTap ,required String title, required bool showCheck}) {
    return Padding(
      padding: 14.allEdge,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: kWhiteColor
              ),
            ),

            const Spacer(),

            Visibility(
              visible: showCheck,
              child: Image(
                height: 25,
                width: 25,
                fit: BoxFit.fill,
                image: AssetImage(
                    Assets.images.checkPNG
                ),
              ),
            )

          ],
        ),
      ),
    ) ;
  }

}
