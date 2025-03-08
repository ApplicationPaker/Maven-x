import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

class ChatModel {

  final String image ;
  final String name ;
  final Color status ;
  final int totalMessages ;
  final String date ;

  ChatModel(this.image, this.name, this.status, this.totalMessages, this.date);

}


List<ChatModel> chatList = [
  
  ChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Aidem makram", kGreenColor, 10, "Yesterday"),
  ChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg1dIOAjqRZTG33LCikcTs75d2G2OJH9vnTA&usqp=CAU", "Colin Munro", kRedColor, 0, "27/5/2024"),
  ChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffVXFgYxENiH-VLaMIoiIgkDilyO2hA9VIw&usqp=CAU", "Dale steyn", kYellowColor, 20 ,"2 days ago"),
  ChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU", "Virat kholi", kGreenColor, 40 ,"1 day ago"),
  ChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0rfm7ulLh-hULWlR8NBtrIwRCCWql8VQ9zw&usqp=CAU", "Faf fu plusis", kDarkGreyColor, 110, "11/4/2024")

] ;
