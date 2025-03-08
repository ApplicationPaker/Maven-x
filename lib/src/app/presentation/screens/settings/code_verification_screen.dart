import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {

  bool backDropBlur = false ;


  @override
  Widget build(BuildContext context) {
    var width = AppConstants.mediaWidth(context) ;
  
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          padding: 12.allEdge,
          child: Stack(
            children: [

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Column(
                      children: [
                        50.sh,

                        SizedBox(
                          width: width,
                          child: Text(
                            "Enter your verification code",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),

                        20.sh,

                        Text(
                          "We sent a 6-digit code to",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kSecondaryTextColor
                          ),
                        ),

                        5.sh,

                        Text(
                          "xewideh415@flexvio.com",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kDarkOrangeColor
                          ),
                        ),

                        5.sh,

                        Text(
                          "Confirm it belongs to you to keep your ",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kSecondaryTextColor
                          ),
                        ),

                        Text(
                          "account secure.",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kSecondaryTextColor
                          ),
                        ),

                        20.sh,
                      ],
                    ),

                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: kGreyButtonColor,
                      enabledBorderColor: kWhiteColor,
                      disabledBorderColor: kGreyButtonColor,
                      cursorColor: kWhiteColor,
                      focusedBorderColor: kWhiteColor,
                      styles: List.generate(6, (index) => const TextStyle(
                          color: kWhiteColor
                      )),
                      margin: 6.horizontalEdge,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                      },
                      onSubmit: (String verificationCode){
                      }, // end onSubmit
                    ),

                    Column(
                      children: [
                        20.sh,

                        Text(
                          "Resend code",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kDarkOrangeColor
                          ),
                        ),

                        20.sh,

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "Update email?",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kWhiteColor
                              ),
                            ),

                            Text(
                              " Go to setting",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kDarkOrangeColor
                              ),
                            ),

                          ],
                        ),


                        30.sh,

                        SizedBox(
                          width: width * 0.85,
                          child: Text(
                            "MAVEN X may use your phone number to send notifications with information regarding your account.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: kSecondaryTextColor
                            ),
                          ),
                        ),

                        50.sh,
                      ],
                    ),

                    CustomButton(
                      width: width * 0.85,
                      onPressed: (){

                        setState(() {
                          backDropBlur = true ;
                        });

                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return phoneVerifiedSheet() ;
                            }
                        ).then((value) {
                          setState(() {
                            backDropBlur = false ;
                          });
                        }) ;

                      },
                      text: "Submit",
                    ),

                    20.sh,

                    TextButton(
                        onPressed: ()=> Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: kSecondaryTextColor
                          ),
                        )
                    ),

                  ],
                ),
              ),

              Visibility(
                visible: backDropBlur,
                child: Container(
                  width: AppConstants.mediaWidth(context),
                  height: AppConstants.mediaHeight(context),
                  color: kDarkGreyColor.withOpacity(0.6),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                    child: const SizedBox.shrink(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ) ;
  }


  phoneVerifiedSheet() {
    return Container(
      padding: 20.allEdge,
      width: AppConstants.mediaWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            "Phone Number Verified",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: kWhiteColor
            ),
          ),

          30.sh,

          SizedBox(
            width: AppConstants.mediaWidth(context),
            child: Text(
              "Success! Your phone number has been successfully verified. This step is vital for security reasons, ensuring that your account remains safe and personal.",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kSecondaryTextColor
              ),
            ),
          ),

          20.sh,


          CustomButton(
              width: AppConstants.mediaWidth(context),
              onPressed: (){
                Navigator.pop(context) ;
                twoFactorSheet() ;
                
              },
              text: "Done"
          ),

          20.sh,

        ],
      ),
    ) ;
  }


  twoFactorSheet() {
    setState(() {
      backDropBlur = true ;
    });

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: AppConstants.mediaWidth(context),
            padding: 20.allEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                20.sh,

                Image(
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                    image: AssetImage(
                        Assets.images.securityPNG
                    )
                ),

                20.sh,

                SizedBox(
                  width: AppConstants.mediaWidth(context) * 0.6,
                  child: Text(
                    "Two-Factor Authentication has been enabled",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kWhiteColor
                    ),
                  ),
                ),

                20.sh,

                CustomButton(
                  onPressed: ()=> Navigator.pop(context),
                  text: 'Done',
                  width: AppConstants.mediaWidth(context),
                ),


                20.sh,

              ],
            ),
          ) ;
        }
    ).then((value) {
      setState(() {
        backDropBlur = false ;
      });
    }) ;

  }


}
