import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_text_field.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/data/models/search_model.dart';
import '../../utils/assets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  List<String> recentSearchList = [
    "Xodi",
    "Xavior",
    "Makram",
    "Linda",
    "George"
  ] ;


  List<SearchModel> filterSearchList = [] ;

  @override
  void initState() {
    filterSearchList.addAll(searchList) ;
    // TODO: implement initState
    super.initState();
  }

  final controller = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          padding: 14.allEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          
              5.sh,
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                    ),
                  ),
                  
                  4.sw,
          
                  Expanded(
                    child: CustomTextField(
                      controller: controller,
                      onChange: (String? text) {

                        setState(() {
                          filterSearchList = searchList.where((e) => e.name.toLowerCase().contains(text?.toLowerCase() ?? "")).toList() ;
                        });

                      },
                      fillColor: kTextFieldColor,
                    ),
                  ),
                  
                ],
              ),
          
              20.sh,


              if(filterSearchList.isEmpty)
                Expanded(
                    child: SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image(
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                            image: AssetImage(
                                Assets.images.noDataFoundPNG
                            ),
                          ),

                          20.sh,



                        ],
                      ),
                    )
                ),
              

              if(filterSearchList.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(
                          width: width,
                          child: Text(
                            "Recent Search",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: kWhiteColor
                            ),
                          ),
                        ),

                        20.sh,

                        Column(
                          children: List.generate(recentSearchList.length, (index) => Padding(
                            padding: 20.bottomEdge,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  recentSearchList[index],
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      color: kWhiteColor
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    recentSearchList.removeAt(index) ;
                                  },
                                  child: ImageIcon(
                                    AssetImage(Assets.images.closePNG),
                                    color: kWhiteColor,
                                    size: 20,
                                  ),
                                ),

                              ],
                            ),
                          )
                          ),
                        ),

                        10.sh,

                        ListView.builder(
                            itemCount: filterSearchList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final e = filterSearchList[index] ;

                              return Container(
                                margin: 15.bottomEdge,
                                width: width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image(
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              e.image
                                          )
                                      ),
                                    ),

                                    20.sw,

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          SizedBox(
                                            width: width,
                                            child: Text(
                                              e.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                  color: kWhiteColor
                                              ),
                                            ),
                                          ),

                                          3.sh,

                                          SizedBox(
                                            width: width,
                                            child: Text(
                                              e.subTitle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                                  color: kSecondaryTextColor
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    Row(
                                      children: [

                                        CircleAvatar(
                                          backgroundColor: kRedColor,
                                          radius: 5,
                                        ),

                                        10.sw,

                                        Text(
                                          e.no.toString(),
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                              color: kWhiteColor
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ) ;
                            }
                        ),

                      ],
                    ),
                  ),
                ),
              
              
          
            ],
          ),
        ),
      ),
    ) ;
  }


  @override
  void dispose() {
    controller.dispose() ;
    // TODO: implement dispose
    super.dispose();
  }

}
