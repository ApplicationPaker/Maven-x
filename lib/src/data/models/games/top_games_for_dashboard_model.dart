
import 'dart:convert';

TopGamesForDashboardModel topGamesForDashboardModelFromJson(String str) => TopGamesForDashboardModel.fromJson(json.decode(str));

String topGamesForDashboardModelToJson(TopGamesForDashboardModel data) => json.encode(data.toJson());

class TopGamesForDashboardModel {
    bool? success;
    List<TopGamesForDashboard>? topGamesForDashboard;

    TopGamesForDashboardModel({
        this.success,
        this.topGamesForDashboard,
    });

    factory TopGamesForDashboardModel.fromJson(Map<String, dynamic> json) => TopGamesForDashboardModel(
        success: json["success"],
        topGamesForDashboard: json["topGamesForDashboard"] == null ? [] : List<TopGamesForDashboard>.from(json["topGamesForDashboard"]!.map((x) => TopGamesForDashboard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "topGamesForDashboard": topGamesForDashboard == null ? [] : List<dynamic>.from(topGamesForDashboard!.map((x) => x.toJson())),
    };
}

class TopGamesForDashboard {
    String? gameId;
    String? gameName;
    String? gameImageUrl;
    String? totalLiveViewers;
    List<Tag>? tags;

    TopGamesForDashboard({
        this.gameId,
        this.gameName,
        this.gameImageUrl,
        this.totalLiveViewers,
        this.tags,
    });

    factory TopGamesForDashboard.fromJson(Map<String, dynamic> json) => TopGamesForDashboard(
        gameId: json["gameId"],
        gameName: json["gameName"],
        gameImageUrl: json["gameImageURL"],
        totalLiveViewers: json["totalLiveViewers"],
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "gameId": gameId,
        "gameName": gameName,
        "gameImageURL": gameImageUrl,
        "totalLiveViewers": totalLiveViewers,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    };
}

class Tag {
    String? tag;

    Tag({
        this.tag,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tag: json["tag"],
    );

    Map<String, dynamic> toJson() => {
        "tag": tag,
    };
}
