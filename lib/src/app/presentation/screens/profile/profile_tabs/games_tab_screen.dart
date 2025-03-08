import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import '../../../utils/assets.dart';

class GamesTabScreen extends StatefulWidget {
  const GamesTabScreen({Key? key}) : super(key: key);

  @override
  State<GamesTabScreen> createState() => _GamesTabScreenState();
}

class _GamesTabScreenState extends State<GamesTabScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = AppConstants.mediaHeight(context);
    var width = AppConstants.mediaWidth(context);

    return Padding(
      padding: 10.topEdge,
      child: GridView.builder(
          itemCount: 27,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              mainAxisExtent: height * 0.18),
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      )),
                      // enableDrag: true,
                      builder: (context) {
                        return Container(
                          width: width,
                          height: height * 0.6,
                          padding: 12.allEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Follow Games",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: kWhiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                              ),

                              10.sh,

                              TextFormField(
                                controller: _controller,
                                style: TextStyle(
                                  color: kWhiteColor
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kWhiteColor,
                                  ),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: kGreyColor, fontSize: 16),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 0.5)),
                                ),
                              ),

                              10.sh,


                              Expanded(
                                child: GridView.builder(
                                    itemCount: 27,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: height * 0.18
                                ),
                                    itemBuilder: (context,index) {
                                      return Container(
                                        width: width / 3,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    Assets.images.gameJPG
                                                )
                                            )
                                        ),
                                      );
                                    }
                                ),
                              ),

                              CustomButton(
                                  width: width,
                                  onPressed: (){
                                    Navigator.pop(context) ;
                                  },
                                  text: "Done",

                              )
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kGreyColor),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: kWhiteColor,
                      size: 40,
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                width: width / 3,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(Assets.images.gameJPG))),
              );
            }
          }),
    );
  }
}
