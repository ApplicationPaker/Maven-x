// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class CustomDialogWidget extends StatelessWidget {
  final Widget dialogWidget;
  final bool? isClosable;


  const CustomDialogWidget({
    Key? key,
   

    required this.dialogWidget,
     this.isClosable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPadding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Container(
              
              padding: const EdgeInsets.all(kPadding*2.5),
              margin: const EdgeInsets.only(top: 66),
              decoration: BoxDecoration(
                color: kTertiaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kBlackColor.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: dialogWidget
            ),
          ),
         isClosable == false?const SizedBox(): Positioned(
              top: 55,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadius),
                    color: kGreyButtonColor),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: kWhiteColor,
                      size: 20,
                    )),
              )),
        ],
      ),
    );
  }
}
