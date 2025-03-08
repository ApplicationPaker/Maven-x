import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

showMyCustomSnackBar(
  String toastMessage,
  bool isError,
  context,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
      dismissDirection: DismissDirection.down,
      backgroundColor: kWhiteColor.withOpacity(0.9),
      elevation: 7,
      content: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              // isError
              //     ? "assets/images/png/toast_error.png"
              //     : "assets/images/png/shamuk-n-white.png",
              "https://th.bing.com/th/id/R.efa2b0fd78770d16a2bf2d1fca52c5e1?rik=BBBZW3cyblwT%2bQ&pid=ImgRaw&r=0",
              // height: 60,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              toastMessage,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
