// To parse this JSON data, do
//
//     final userChannelFollowingByUserGuidModel = userChannelFollowingByUserGuidModelFromJson(jsonString);

import 'dart:convert';

UserChannelFollowingByUserGuidModel userChannelFollowingByUserGuidModelFromJson(String str) => UserChannelFollowingByUserGuidModel.fromJson(json.decode(str));

String userChannelFollowingByUserGuidModelToJson(UserChannelFollowingByUserGuidModel data) => json.encode(data.toJson());

class UserChannelFollowingByUserGuidModel {
    bool? success;
    List<UserChannelFollowing>? userChannelFollowings;

    UserChannelFollowingByUserGuidModel({
        this.success,
        this.userChannelFollowings,
    });

    factory UserChannelFollowingByUserGuidModel.fromJson(Map<String, dynamic> json) => UserChannelFollowingByUserGuidModel(
        success: json["success"],
        userChannelFollowings: json["userChannelFollowings"] == null ? [] : List<UserChannelFollowing>.from(json["userChannelFollowings"]!.map((x) => UserChannelFollowing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userChannelFollowings": userChannelFollowings == null ? [] : List<dynamic>.from(userChannelFollowings!.map((x) => x.toJson())),
    };
}

class UserChannelFollowing {
    String? userGuidId;
    String? userName;
    String? profileImageUrl;

    UserChannelFollowing({
        this.userGuidId,
        this.userName,
        this.profileImageUrl,
    });

    factory UserChannelFollowing.fromJson(Map<String, dynamic> json) => UserChannelFollowing(
        userGuidId: json["userGuidId"],
        userName: json["userName"],
        profileImageUrl: json["profileImageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "userGuidId": userGuidId,
        "userName": userName,
        "profileImageUrl": profileImageUrl,
    };
}
