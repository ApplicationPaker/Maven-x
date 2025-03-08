import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/screens/profile/widgets/more_tile.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "More",style: TextStyle(color: kWhiteColor,fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: 20.topEdge,
        width: width,
        padding: 12.allEdge,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
          
             MoreTile(
                 onTap: (){},
                 title: "About",
                 bottomStraightBorder: true,
                 withBorder: true,
             ),
          
              MoreTile(
                onTap: (){},
                title: "Terms & Condition",
                withBorder: true,
              ),
          
              MoreTile(
                onTap: (){},
                title: "Privacy Policy",
                withBorder: true,
              ),
          
              MoreTile(
                onTap: (){},
                title: "Community Guideline",
                withBorder: true,
              ),
          
              MoreTile(
                onTap: (){},
                title: "DMCA Policy",
                withBorder: true,
              ),
          
              MoreTile(
                onTap: (){},
                title: "Cookie Policy",
                withBorder: true,
              ),
          
              MoreTile(
                onTap: (){},
                title: "Help & Support",
                topStraightBorder: true,
              ),
          
            ],
          ),
        ),
      ),

    ) ;
  }
}
