// To parse this JSON data, do
//
//     final streamingPageChatModel = streamingPageChatModelFromJson(jsonString);

import 'dart:convert';

StreamingPageChatModel streamingPageChatModelFromJson(String str) => StreamingPageChatModel.fromJson(json.decode(str));

String streamingPageChatModelToJson(StreamingPageChatModel data) => json.encode(data.toJson());

class StreamingPageChatModel {
    bool? success;
    List<Chat>? chats;
    int? totalChats;

    StreamingPageChatModel({
        this.success,
        this.chats,
        this.totalChats,
    });

    factory StreamingPageChatModel.fromJson(Map<String, dynamic> json) => StreamingPageChatModel(
        success: json["success"],
        chats: json["chats"] == null ? [] : List<Chat>.from(json["chats"]!.map((x) => Chat.fromJson(x))),
        totalChats: json["totalChats"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "chats": chats == null ? [] : List<dynamic>.from(chats!.map((x) => x.toJson())),
        "totalChats": totalChats,
    };
}

class Chat {
    String? id;
    int? streamId;
    String? userGuid;
    String? userName;
    String? profilePicture;
    String? chatContent;
    DateTime? createdOn;
    dynamic parentMessageId;
    dynamic parentMessageContent;
    dynamic parentMessageUserName;
    dynamic isParentMessageDeleted;
    dynamic parentMessageBadgeName;
    dynamic parentMessageUserBadge;
    bool? isDeleted;
    dynamic badgeUrl;
    String? badgeName;
    String? userBadge;
    bool? isAiGenerated;
    bool? isSuccess;
    dynamic errorMessage;

    Chat({
        this.id,
        this.streamId,
        this.userGuid,
        this.userName,
        this.profilePicture,
        this.chatContent,
        this.createdOn,
        this.parentMessageId,
        this.parentMessageContent,
        this.parentMessageUserName,
        this.isParentMessageDeleted,
        this.parentMessageBadgeName,
        this.parentMessageUserBadge,
        this.isDeleted,
        this.badgeUrl,
        this.badgeName,
        this.userBadge,
        this.isAiGenerated,
        this.isSuccess,
        this.errorMessage,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        streamId: json["streamId"],
        userGuid: json["userGUID"],
        userName: json["userName"],
        profilePicture: json["profilePicture"],
        chatContent: json["chatContent"],
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        parentMessageId: json["parentMessageId"],
        parentMessageContent: json["parentMessageContent"],
        parentMessageUserName: json["parentMessageUserName"],
        isParentMessageDeleted: json["isParentMessageDeleted"],
        parentMessageBadgeName: json["parentMessageBadgeName"],
        parentMessageUserBadge: json["parentMessageUserBadge"],
        isDeleted: json["isDeleted"],
        badgeUrl: json["badgeURL"],
        badgeName: json["badgeName"],
        userBadge: json["userBadge"],
        isAiGenerated: json["isAIGenerated"],
        isSuccess: json["isSuccess"],
        errorMessage: json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "streamId": streamId,
        "userGUID": userGuid,
        "userName": userName,
        "profilePicture": profilePicture,
        "chatContent": chatContent,
        "createdOn": createdOn?.toIso8601String(),
        "parentMessageId": parentMessageId,
        "parentMessageContent": parentMessageContent,
        "parentMessageUserName": parentMessageUserName,
        "isParentMessageDeleted": isParentMessageDeleted,
        "parentMessageBadgeName": parentMessageBadgeName,
        "parentMessageUserBadge": parentMessageUserBadge,
        "isDeleted": isDeleted,
        "badgeURL": badgeUrl,
        "badgeName": badgeName,
        "userBadge": userBadge,
        "isAIGenerated": isAiGenerated,
        "isSuccess": isSuccess,
        "errorMessage": errorMessage,
    };
}
