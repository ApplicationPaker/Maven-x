
import 'dart:convert';

UserChannelModel userChannelModelFromJson(String str) => UserChannelModel.fromJson(json.decode(str));

String userChannelModelToJson(UserChannelModel data) => json.encode(data.toJson());

class UserChannelModel {
    bool? success;
    Channel? channel;

    UserChannelModel({
        this.success,
        this.channel,
    });

    factory UserChannelModel.fromJson(Map<String, dynamic> json) => UserChannelModel(
        success: json["success"],
        channel: json["channel"] == null ? null : Channel.fromJson(json["channel"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "channel": channel?.toJson(),
    };
}

class Channel {
    int? id;
    String? userGuid;
    String? profileImageUrl;
    dynamic bannerImageUrl;
    String? bannerVideoUrl;
    String? displayName;
    bool? isActive;
    String? descriptionOfChannel;
    dynamic intagramLink;
    dynamic facebookLink;
    dynamic youTubeLink;
    dynamic twitterLink;
    String? streamKey;
    dynamic channelBio;
    bool? isStorePastBroadCastEnabled;
    bool? isPublishVideosEnabled;
    bool? isStreamConfigConsented;
    List<dynamic>? userSocialMediaPlatforms;

    Channel({
        this.id,
        this.userGuid,
        this.profileImageUrl,
        this.bannerImageUrl,
        this.bannerVideoUrl,
        this.displayName,
        this.isActive,
        this.descriptionOfChannel,
        this.intagramLink,
        this.facebookLink,
        this.youTubeLink,
        this.twitterLink,
        this.streamKey,
        this.channelBio,
        this.isStorePastBroadCastEnabled,
        this.isPublishVideosEnabled,
        this.isStreamConfigConsented,
        this.userSocialMediaPlatforms,
    });

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        userGuid: json["userGuid"],
        profileImageUrl: json["profileImageUrl"],
        bannerImageUrl: json["bannerImageUrl"],
        bannerVideoUrl: json["bannerVideoUrl"],
        displayName: json["displayName"],
        isActive: json["isActive"],
        descriptionOfChannel: json["descriptionOfChannel"],
        intagramLink: json["intagramLink"],
        facebookLink: json["facebookLink"],
        youTubeLink: json["youTubeLink"],
        twitterLink: json["twitterLink"],
        streamKey: json["streamKey"],
        channelBio: json["channelBio"],
        isStorePastBroadCastEnabled: json["isStorePastBroadCastEnabled"],
        isPublishVideosEnabled: json["isPublishVideosEnabled"],
        isStreamConfigConsented: json["isStreamConfigConsented"],
        userSocialMediaPlatforms: json["userSocialMediaPlatforms"] == null ? [] : List<dynamic>.from(json["userSocialMediaPlatforms"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userGuid": userGuid,
        "profileImageUrl": profileImageUrl,
        "bannerImageUrl": bannerImageUrl,
        "bannerVideoUrl": bannerVideoUrl,
        "displayName": displayName,
        "isActive": isActive,
        "descriptionOfChannel": descriptionOfChannel,
        "intagramLink": intagramLink,
        "facebookLink": facebookLink,
        "youTubeLink": youTubeLink,
        "twitterLink": twitterLink,
        "streamKey": streamKey,
        "channelBio": channelBio,
        "isStorePastBroadCastEnabled": isStorePastBroadCastEnabled,
        "isPublishVideosEnabled": isPublishVideosEnabled,
        "isStreamConfigConsented": isStreamConfigConsented,
        "userSocialMediaPlatforms": userSocialMediaPlatforms == null ? [] : List<dynamic>.from(userSocialMediaPlatforms!.map((x) => x)),
    };
}
