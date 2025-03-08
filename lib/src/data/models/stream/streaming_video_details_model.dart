
import 'dart:convert';

StreamingVideoDetailModel streamingVideoDetailModelFromJson(String str) => StreamingVideoDetailModel.fromJson(json.decode(str));

String streamingVideoDetailModelToJson(StreamingVideoDetailModel data) => json.encode(data.toJson());

class StreamingVideoDetailModel {
    bool? success;
    StreamingDetails? streamingDetails;
    UserProfileDetails? userProfileDetails;

    StreamingVideoDetailModel({
        this.success,
        this.streamingDetails,
        this.userProfileDetails,
    });

    factory StreamingVideoDetailModel.fromJson(Map<String, dynamic> json) => StreamingVideoDetailModel(
        success: json["success"],
        streamingDetails: json["streamingDetails"] == null ? null : StreamingDetails.fromJson(json["streamingDetails"]),
        userProfileDetails: json["userProfileDetails"] == null ? null : UserProfileDetails.fromJson(json["userProfileDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "streamingDetails": streamingDetails?.toJson(),
        "userProfileDetails": userProfileDetails?.toJson(),
    };
}

class StreamingDetails {
    int? streamId;
    int? channelId;
    String? userGuidId;
    String? streamThumbnail;
    String? streamUrl;
    String? bitRate;
    String? resolution;
    String? profileImageUrl;
    String? userName;
    int? gameId;
    String? gameName;
    String? description;
    String? title;
    int? viewers;
    DateTime? startTime;
    String? channelBio;
    int? followers;
    bool? isEighteenPlusConsented;
    List<dynamic>? streamTags;
    List<dynamic>? userSocialMediaPlatforms;

    StreamingDetails({
        this.streamId,
        this.channelId,
        this.userGuidId,
        this.streamThumbnail,
        this.streamUrl,
        this.bitRate,
        this.resolution,
        this.profileImageUrl,
        this.userName,
        this.gameId,
        this.gameName,
        this.description,
        this.title,
        this.viewers,
        this.startTime,
        this.channelBio,
        this.followers,
        this.isEighteenPlusConsented,
        this.streamTags,
        this.userSocialMediaPlatforms,
    });

    factory StreamingDetails.fromJson(Map<String, dynamic> json) => StreamingDetails(
        streamId: json["streamId"],
        channelId: json["channelId"],
        userGuidId: json["userGuidId"],
        streamThumbnail: json["streamThumbnail"],
        streamUrl: json["streamURL"],
        bitRate: json["bitRate"],
        resolution: json["resolution"],
        profileImageUrl: json["profileImageUrl"],
        userName: json["userName"],
        gameId: json["gameId"],
        gameName: json["gameName"],
        description: json["description"],
        title: json["title"],
        viewers: json["viewers"],
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        channelBio: json["channelBio"],
        followers: json["followers"],
        isEighteenPlusConsented: json["isEighteenPlusConsented"],
        streamTags: json["streamTags"] == null ? [] : List<dynamic>.from(json["streamTags"]!.map((x) => x)),
        userSocialMediaPlatforms: json["userSocialMediaPlatforms"] == null ? [] : List<dynamic>.from(json["userSocialMediaPlatforms"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "streamId": streamId,
        "channelId": channelId,
        "userGuidId": userGuidId,
        "streamThumbnail": streamThumbnail,
        "streamURL": streamUrl,
        "bitRate": bitRate,
        "resolution": resolution,
        "profileImageUrl": profileImageUrl,
        "userName": userName,
        "gameId": gameId,
        "gameName": gameName,
        "description": description,
        "title": title,
        "viewers": viewers,
        "startTime": startTime?.toIso8601String(),
        "channelBio": channelBio,
        "followers": followers,
        "isEighteenPlusConsented": isEighteenPlusConsented,
        "streamTags": streamTags == null ? [] : List<dynamic>.from(streamTags!.map((x) => x)),
        "userSocialMediaPlatforms": userSocialMediaPlatforms == null ? [] : List<dynamic>.from(userSocialMediaPlatforms!.map((x) => x)),
    };
}

class UserProfileDetails {
    int? channelId;
    String? userGuidId;
    String? profileImageUrl;
    String? userName;
    String? bio;
    DateTime? createdOn;
    String? bannerImageUrl;
    int? followers;
    int? following;
    int? views;
    int? subscribers;
    int? achievementLevel;
    String? badgeName;
    String? userBadge;
    List<String>? tags;
    List<dynamic>? userSocialMediaPlatforms;
    String? fullName;
    String? email;
    String? phoneNumber;
    String? streamKey;
    int? clips;
    int? likes;
    bool? isSuccess;
    dynamic errorMessage;

    UserProfileDetails({
        this.channelId,
        this.userGuidId,
        this.profileImageUrl,
        this.userName,
        this.bio,
        this.createdOn,
        this.bannerImageUrl,
        this.followers,
        this.following,
        this.views,
        this.subscribers,
        this.achievementLevel,
        this.badgeName,
        this.userBadge,
        this.tags,
        this.userSocialMediaPlatforms,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.streamKey,
        this.clips,
        this.likes,
        this.isSuccess,
        this.errorMessage,
    });

    factory UserProfileDetails.fromJson(Map<String, dynamic> json) => UserProfileDetails(
        channelId: json["channelId"],
        userGuidId: json["userGuidId"],
        profileImageUrl: json["profileImageUrl"],
        userName: json["userName"],
        bio: json["bio"],
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        bannerImageUrl: json["bannerImageUrl"],
        followers: json["followers"],
        following: json["following"],
        views: json["views"],
        subscribers: json["subscribers"],
        achievementLevel: json["achievementLevel"],
        badgeName: json["badgeName"],
        userBadge: json["userBadge"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        userSocialMediaPlatforms: json["userSocialMediaPlatforms"] == null ? [] : List<dynamic>.from(json["userSocialMediaPlatforms"]!.map((x) => x)),
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        streamKey: json["streamKey"],
        clips: json["clips"],
        likes: json["likes"],
        isSuccess: json["isSuccess"],
        errorMessage: json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "userGuidId": userGuidId,
        "profileImageUrl": profileImageUrl,
        "userName": userName,
        "bio": bio,
        "createdOn": createdOn?.toIso8601String(),
        "bannerImageUrl": bannerImageUrl,
        "followers": followers,
        "following": following,
        "views": views,
        "subscribers": subscribers,
        "achievementLevel": achievementLevel,
        "badgeName": badgeName,
        "userBadge": userBadge,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userSocialMediaPlatforms": userSocialMediaPlatforms == null ? [] : List<dynamic>.from(userSocialMediaPlatforms!.map((x) => x)),
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "streamKey": streamKey,
        "clips": clips,
        "likes": likes,
        "isSuccess": isSuccess,
        "errorMessage": errorMessage,
    };
}
