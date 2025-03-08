// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

class CommentModel {
  final String userImg;
  final String userName;
  final String uID;

  final String comment;
  final Color color;

  CommentModel({
    required this.userImg,
    required this.userName,
    required this.uID,
    required this.comment,
    required this.color,
  });
}

List<CommentModel> commentList = [
  CommentModel(
    userImg: "https://th.bing.com/th/id/R.52f554f5142d7265944f220007ba4f18?rik=ml15N7nufCLKSA&pid=ImgRaw&r=0",
    userName: "Narkstyle",
    uID: "1",
    comment: "TAKE MONNEY FROM EVERYBODY",
    color: kBlueColor,
  ),
  CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.S0WtvQSRgTWVzi4N7_fvFAHaLH?rs=1&pid=ImgDetMain",
    userName: "kimmyhead338",
    uID: "1",
    color: kGreenColor,
    comment: "mistah Dundee",
  ),
   CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.S0WtvQSRgTWVzi4N7_fvFAHaLH?rs=1&pid=ImgDetMain",
    userName: "kimmyhead338",
    uID: "1",
    color: kGreenColor,
    comment: "mistah Dundee",
  ),
  CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.ooMsE4-L9sZr4JKjul74JwHaE8?rs=1&pid=ImgDetMain",
    userName: "shon386",
    uID: "1",
    comment: "I have to look that up. hope they have a free version",
    color: kPinkColor,
  ),
  CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.kfM6gE5n_IxPxrdgZg7SigHaLH?rs=1&pid=ImgDetMain",
    userName: "ikantreeed",
    uID: "1",
    comment: "Ayo how is it call again when... SOAKING!!! thanks",
    color: kPrimaryColor,
  ),
  CommentModel(
    userImg: "https://wallpapercave.com/wp/wp8781444.jpg",
    userName: "MaxThomas2006",
    uID: "1",
    comment: "Do you think your actually 11-1 ??",
    color: kPurpleColor,
  ),
  CommentModel(
    userImg: "https://i.pinimg.com/736x/0a/a6/89/0aa689eb2ce667ce21b14ec2a4dc0211.jpg",
    userName: "happymohamed",
    uID: "1",
    comment:
        "@brokenarrow2627 only laptop hacking and thermite, not the best at var",
    color: kGreenColor,
  ),
  CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.S0WtvQSRgTWVzi4N7_fvFAHaLH?rs=1&pid=ImgDetMain",
    userName: "kimmyhead338",
    uID: "1",
    color: kGreenColor,
    comment: "mistah Dundee",
  ),
  CommentModel(
    userImg: "https://th.bing.com/th/id/OIP.ooMsE4-L9sZr4JKjul74JwHaE8?rs=1&pid=ImgDetMain",
    userName: "shon386",
    uID: "1",
    comment: "I have to look that up. hope they have a free version",
    color: kPinkColor,
  ),
];
