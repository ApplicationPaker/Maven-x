
import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    bool? success;
    List<Notification>? notifications;
    int? totalUnreadNotifications;

    NotificationModel({
        this.success,
        this.notifications,
        this.totalUnreadNotifications,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        success: json["success"],
        notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
        totalUnreadNotifications: json["totalUnreadNotifications"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
        "totalUnreadNotifications": totalUnreadNotifications,
    };
}

class Notification {
    int? id;
    String? category;
    String? fromUserGuid;
    String? fromUserName;
    String? fromUserProfileUrl;
    String? toUserGuid;
    String? message;
    DateTime? notificationDateTime;
    bool? isRed;
    dynamic redirectionUrl;
    dynamic badgeName;
    dynamic userBadge;

    Notification({
        this.id,
        this.category,
        this.fromUserGuid,
        this.fromUserName,
        this.fromUserProfileUrl,
        this.toUserGuid,
        this.message,
        this.notificationDateTime,
        this.isRed,
        this.redirectionUrl,
        this.badgeName,
        this.userBadge,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        category: json["category"],
        fromUserGuid: json["fromUserGuid"],
        fromUserName: json["fromUserName"],
        fromUserProfileUrl: json["fromUserProfileUrl"],
        toUserGuid: json["toUserGuid"],
        message: json["message"],
        notificationDateTime: json["notificationDateTime"] == null ? null : DateTime.parse(json["notificationDateTime"]),
        isRed: json["isRed"],
        redirectionUrl: json["redirectionURL"],
        badgeName: json["badgeName"],
        userBadge: json["userBadge"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "fromUserGuid": fromUserGuid,
        "fromUserName": fromUserName,
        "fromUserProfileUrl": fromUserProfileUrl,
        "toUserGuid": toUserGuid,
        "message": message,
        "notificationDateTime": notificationDateTime?.toIso8601String(),
        "isRed": isRed,
        "redirectionURL": redirectionUrl,
        "badgeName": badgeName,
        "userBadge": userBadge,
    };
}
