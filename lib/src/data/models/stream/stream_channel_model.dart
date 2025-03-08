
import 'dart:convert';

StreamChannelModel preferenceBasedStreamForDashboardModelFromJson(String str) => StreamChannelModel.fromJson(json.decode(str));

String preferenceBasedStreamForDashboardModelToJson(StreamChannelModel data) => json.encode(data.toJson());

class StreamChannelModel {
   
    List<ChannelModel>? channels;

    StreamChannelModel({
       
        this.channels,
    });

    factory StreamChannelModel.fromJson( json) => StreamChannelModel(
     
        channels: json == null ? [] : List<ChannelModel>.from(json.map((x) => ChannelModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      
        "$channels": channels == null ? [] : List<dynamic>.from(channels!.map((x) => x.toJson())),
    };
}

class ChannelModel {
    int? id;
    String? userGuid;
    String? userName;
    String? title;
    String? description;
    int? gameId;
    String? gameName;
    String? liveThumbnail;
    String? images;
    int? duration;
    int? follower;
    int? maxLiveViews;
    dynamic tags;
    String? badgeName;
    String? userBadge;

    ChannelModel({
        this.id,
        this.userGuid,
        this.userName,
        this.title,
        this.description,
        this.gameId,
        this.gameName,
        this.liveThumbnail,
        this.images,
        this.duration,
        this.follower,
        this.maxLiveViews,
        this.tags,
        this.badgeName,
        this.userBadge,
    });

    factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        id: json["id"],
        userGuid: json["userGUID"],
        userName: json["userName"],
        title: json["title"],
        description: json["description"],
        gameId: json["gameId"],
        gameName: json["gameName"],
        liveThumbnail: json["liveThumbnail"],
        images: json["images"],
        duration: json["duration"],
        follower: json["follower"],
        maxLiveViews: json["maxLiveViews"],
        tags: json["tags"],
        badgeName: json["badgeName"],
        userBadge: json["userBadge"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userGUID": userGuid,
        "userName": userName,
        "title": title,
        "description": description,
        "gameId": gameId,
        "gameName": gameName,
        "liveThumbnail": liveThumbnail,
        "images": images,
        "duration": duration,
        "follower": follower,
        "maxLiveViews": maxLiveViews,
        "tags": tags,
        "badgeName": badgeName,
        "userBadge": userBadge,
    };
}
