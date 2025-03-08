
import 'dart:convert';

FavoriteGamesModel favoriteGamesModelFromJson(String str) => FavoriteGamesModel.fromJson(json.decode(str));

String favoriteGamesModelToJson(FavoriteGamesModel data) => json.encode(data.toJson());

class FavoriteGamesModel {
    bool? success;
    List<Game>? games;

    FavoriteGamesModel({
        this.success,
        this.games,
    });

    factory FavoriteGamesModel.fromJson(Map<String, dynamic> json) => FavoriteGamesModel(
        success: json["success"],
        games: json["games"] == null ? [] : List<Game>.from(json["games"]!.map((x) => Game.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "games": games == null ? [] : List<dynamic>.from(games!.map((x) => x.toJson())),
    };
}

class Game {
    int? id;
    String? gameName;
    DateTime? addedDateTime;
    DateTime? lastUpdatedDateTime;
    String? gameImageUrl;
    String? gameDescription;
    int? gameGenreId;
    String? gameSmallImage;
    bool? isActive;
    bool? isFeatrued;
    int? minMembers;
    int? maxMembers;
    String? gameBannerImage;

    Game({
        this.id,
        this.gameName,
        this.addedDateTime,
        this.lastUpdatedDateTime,
        this.gameImageUrl,
        this.gameDescription,
        this.gameGenreId,
        this.gameSmallImage,
        this.isActive,
        this.isFeatrued,
        this.minMembers,
        this.maxMembers,
        this.gameBannerImage,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        gameName: json["gameName"],
        addedDateTime: json["addedDateTime"] == null ? null : DateTime.parse(json["addedDateTime"]),
        lastUpdatedDateTime: json["lastUpdatedDateTime"] == null ? null : DateTime.parse(json["lastUpdatedDateTime"]),
        gameImageUrl: json["gameImageURL"],
        gameDescription: json["gameDescription"],
        gameGenreId: json["gameGenreId"],
        gameSmallImage: json["gameSmallImage"],
        isActive: json["isActive"],
        isFeatrued: json["isFeatrued"],
        minMembers: json["minMembers"],
        maxMembers: json["maxMembers"],
        gameBannerImage: json["gameBannerImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gameName": gameName,
        "addedDateTime": addedDateTime?.toIso8601String(),
        "lastUpdatedDateTime": lastUpdatedDateTime?.toIso8601String(),
        "gameImageURL": gameImageUrl,
        "gameDescription": gameDescription,
        "gameGenreId": gameGenreId,
        "gameSmallImage": gameSmallImage,
        "isActive": isActive,
        "isFeatrued": isFeatrued,
        "minMembers": minMembers,
        "maxMembers": maxMembers,
        "gameBannerImage": gameBannerImage,
    };
}
