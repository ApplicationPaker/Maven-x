import 'package:flutter/material.dart';

class ProfileChatModel {
  
  final String image ;
  final String userName ;
  final Color nameColor ;
  final String chat ;

  ProfileChatModel(this.image, this.userName, this.nameColor, this.chat);
}


List<ProfileChatModel> profileChatList = [
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Ramda", Colors.green, "The channel is providing some valuable content"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Saman", Colors.purple, "Just joined, excited to be here!"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Chris", Colors.amber, "Hello everyone, any new updates?"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Tech", Colors.cyan, "I'm impressed by the quality of discussions here."),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "JohnDoe", Colors.teal, "Is there a schedule for upcoming events?"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Jane", Colors.deepOrange, "Thanks for the warm welcome!"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Techie", Colors.indigo, "This channel has a lot of potential."),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "Code", Colors.greenAccent, "Excited to learn from everyone here!"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "AIEnth", Colors.lightBlue, "Any interesting projects going on?"),
  ProfileChatModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU", "DevOps", Colors.redAccent, "Looking forward to collaborating with you all!"),
];