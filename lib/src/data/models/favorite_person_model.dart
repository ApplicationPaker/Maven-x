
import 'dart:convert';

FavoritePersonModel favoritePersonModelFromJson(String str) => FavoritePersonModel.fromJson(json.decode(str));

String favoritePersonModelToJson(FavoritePersonModel data) => json.encode(data.toJson());

class FavoritePersonModel {
    bool? success;
    List<UserChannelFollowing>? userChannelFollowings;

    FavoritePersonModel({
        this.success,
        this.userChannelFollowings,
    });

    factory FavoritePersonModel.fromJson(Map<String, dynamic> json) => FavoritePersonModel(
        success: json["success"],
        userChannelFollowings: json["userChannelFollowings"] == null ? [] : List<UserChannelFollowing>.from(json["userChannelFollowings"]!.map((x) => UserChannelFollowing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userChannelFollowings": userChannelFollowings == null ? [] : List<dynamic>.from(userChannelFollowings!.map((x) => x.toJson())),
    };
}

class UserChannelFollowing {
    int? id;
    String? displayName;
    String? userGuid;
    String? profileImageUrl;
    String? descriptionOfChannel;
    String? channelBio;
    int? mediaPosts;
    int? followers;
    int? following;
    int? likes;
    bool? isUserFollowed;
    List<dynamic>? userSocialMediaPlatforms;

    UserChannelFollowing({
        this.id,
        this.displayName,
        this.userGuid,
        this.profileImageUrl,
        this.descriptionOfChannel,
        this.channelBio,
        this.mediaPosts,
        this.followers,
        this.following,
        this.likes,
        this.isUserFollowed,
        this.userSocialMediaPlatforms,
    });

    factory UserChannelFollowing.fromJson(Map<String, dynamic> json) => UserChannelFollowing(
        id: json["id"],
        displayName: json["displayName"],
        userGuid: json["userGuid"],
        profileImageUrl: json["profileImageUrl"],
        descriptionOfChannel: json["descriptionOfChannel"],
        channelBio: json["channelBio"],
        mediaPosts: json["mediaPosts"],
        followers: json["followers"],
        following: json["following"],
        likes: json["likes"],
        isUserFollowed: json["isUserFollowed"],
        userSocialMediaPlatforms: json["userSocialMediaPlatforms"] == null ? [] : List<dynamic>.from(json["userSocialMediaPlatforms"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "userGuid": userGuid,
        "profileImageUrl": profileImageUrl,
        "descriptionOfChannel": descriptionOfChannel,
        "channelBio": channelBio,
        "mediaPosts": mediaPosts,
        "followers": followers,
        "following": following,
        "likes": likes,
        "isUserFollowed": isUserFollowed,
        "userSocialMediaPlatforms": userSocialMediaPlatforms == null ? [] : List<dynamic>.from(userSocialMediaPlatforms!.map((x) => x)),
    };
}
