
import 'dart:convert';

UserFavoriteGameByUserGuidModel userFavoriteGameByUserGuidModelFromJson(String str) => UserFavoriteGameByUserGuidModel.fromJson(json.decode(str));

String userFavoriteGameByUserGuidModelToJson(UserFavoriteGameByUserGuidModel data) => json.encode(data.toJson());

class UserFavoriteGameByUserGuidModel {
    bool? success;
    List<UserFavouriteGame>? userFavouriteGames;

    UserFavoriteGameByUserGuidModel({
        this.success,
        this.userFavouriteGames,
    });

    factory UserFavoriteGameByUserGuidModel.fromJson(Map<String, dynamic> json) => UserFavoriteGameByUserGuidModel(
        success: json["success"],
        userFavouriteGames: json["userFavouriteGames"] == null ? [] : List<UserFavouriteGame>.from(json["userFavouriteGames"]!.map((x) => UserFavouriteGame.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userFavouriteGames": userFavouriteGames == null ? [] : List<dynamic>.from(userFavouriteGames!.map((x) => x.toJson())),
    };
}

class UserFavouriteGame {
    int? gameId;
    String? gameName;
    String? imageUrl;
    String? smallImageUrl;
    dynamic transparentImageUrl;

    UserFavouriteGame({
        this.gameId,
        this.gameName,
        this.imageUrl,
        this.smallImageUrl,
        this.transparentImageUrl,
    });

    factory UserFavouriteGame.fromJson(Map<String, dynamic> json) => UserFavouriteGame(
        gameId: json["gameId"],
        gameName: json["gameName"],
        imageUrl: json["imageUrl"],
        smallImageUrl: json["smallImageUrl"],
        transparentImageUrl: json["transparentImageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "gameId": gameId,
        "gameName": gameName,
        "imageUrl": imageUrl,
        "smallImageUrl": smallImageUrl,
        "transparentImageUrl": transparentImageUrl,
    };
}
