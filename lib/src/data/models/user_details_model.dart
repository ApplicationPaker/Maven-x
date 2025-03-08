// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
    bool? success;
    User? user;

    UserDetailsModel({
        this.success,
        this.user,
    });

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        success: json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
    };
}

class User {
    String? id;
    String? userName;
    String? email;
    String? passwordHash;
    String? phoneNumber;
    String? fullName;
    dynamic address;
    dynamic address2;
    dynamic postalCode;
    DateTime? lastLoginTime;
    DateTime? registrationDate;
    DateTime? createdDateTime;
    DateTime? lastUpdatedDateTime;
    dynamic timezoneId;
    String? language;
    int? countryId;
    int? stateId;
    int? cityId;
    DateTime?  birthday;
    dynamic notificationAnyoneYesNo;
    dynamic notificationYouFollowYesNo;
    dynamic notificationSocialSomeOneFollowMeYesNo;
    bool? isBanned;
    dynamic bannedDurationId;
    dynamic bannedOn;
    bool? accountDelete;
    dynamic accountDeleteDateTo;
    dynamic accountDeletedOn;
    dynamic accountDeletedBy;
    dynamic psnPin;
    String? profileImageUrl;
    dynamic bannerImageUrl;
    int? userId;
    int? onboardingStep;
    String? refreshToken;
    dynamic otp;
    int? twoFactorEnabledFor;
    UserRole? userRole;
    dynamic badgeName;
    dynamic userBadge;
    String? normalizedUserName;
    String? normalizedEmail;
    bool? emailConfirmed;
    String? securityStamp;
    String? concurrencyStamp;
    bool? phoneNumberConfirmed;
    bool? twoFactorEnabled;
    dynamic lockoutEnd;
    bool? lockoutEnabled;
    int? accessFailedCount;

    User({
        this.id,
        this.userName,
        this.email,
        this.passwordHash,
        this.phoneNumber,
        this.fullName,
        this.address,
        this.address2,
        this.postalCode,
        this.lastLoginTime,
        this.registrationDate,
        this.createdDateTime,
        this.lastUpdatedDateTime,
        this.timezoneId,
        this.language,
        this.countryId,
        this.stateId,
        this.cityId,
        this.birthday,
        this.notificationAnyoneYesNo,
        this.notificationYouFollowYesNo,
        this.notificationSocialSomeOneFollowMeYesNo,
        this.isBanned,
        this.bannedDurationId,
        this.bannedOn,
        this.accountDelete,
        this.accountDeleteDateTo,
        this.accountDeletedOn,
        this.accountDeletedBy,
        this.psnPin,
        this.profileImageUrl,
        this.bannerImageUrl,
        this.userId,
        this.onboardingStep,
        this.refreshToken,
        this.otp,
        this.twoFactorEnabledFor,
        this.userRole,
        this.badgeName,
        this.userBadge,
        this.normalizedUserName,
        this.normalizedEmail,
        this.emailConfirmed,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        // passwordHash: json["passwordHash"],
        phoneNumber: json["phoneNumber"],
        fullName: json["fullName"],
        // address: json["address"],
        // address2: json["address2"],
        // postalCode: json["postalCode"],
        lastLoginTime: json["lastLoginTime"] == null ? null : DateTime.parse(json["lastLoginTime"]),
        registrationDate: json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        createdDateTime: json["createdDateTime"] == null ? null : DateTime.parse(json["createdDateTime"]),
        lastUpdatedDateTime: json["lastUpdatedDateTime"] == null ? null : DateTime.parse(json["lastUpdatedDateTime"]),
        // timezoneId: json["timezoneId"],
        language: json["language"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        birthday:  json["birthday"] == null ? null : DateTime.parse(json["birthday"]), 
        // notificationAnyoneYesNo: json["notificationAnyoneYesNo"],
        // notificationYouFollowYesNo: json["notificationYouFollowYesNo"],
        // notificationSocialSomeOneFollowMeYesNo: json["notificationSocialSomeOneFollowMeYesNo"],
        isBanned: json["isBanned"],
        // bannedDurationId: json["bannedDurationId"],
        // bannedOn: json["bannedOn"],
        accountDelete: json["accountDelete"],
        // accountDeleteDateTo: json["accountDeleteDateTo"],
        // accountDeletedOn: json["accountDeletedOn"],
        // accountDeletedBy: json["accountDeletedBy"],
        // psnPin: json["psnPin"],
        profileImageUrl: json["profileImageURL"],
        // bannerImageUrl: json["bannerImageUrl"],
        userId: json["userId"],
        onboardingStep: json["onboardingStep"],
        refreshToken: json["refreshToken"],
        // otp: json["otp"],
        twoFactorEnabledFor: json["twoFactorEnabledFor"],
        userRole: json["userRole"] == null ? null : UserRole.fromJson(json["userRole"]),
        // badgeName: json["badgeName"],
        // userBadge: json["userBadge"],
        normalizedUserName: json["normalizedUserName"],
        normalizedEmail: json["normalizedEmail"],
        emailConfirmed: json["emailConfirmed"],
        securityStamp: json["securityStamp"],
        concurrencyStamp: json["concurrencyStamp"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        twoFactorEnabled: json["twoFactorEnabled"],
        // lockoutEnd: json["lockoutEnd"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount: json["accessFailedCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "passwordHash": passwordHash,
        "phoneNumber": phoneNumber,
        "fullName": fullName,
        "address": address,
        "address2": address2,
        "postalCode": postalCode,
        "lastLoginTime": lastLoginTime?.toIso8601String(),
        "registrationDate": registrationDate?.toIso8601String(),
        "createdDateTime": createdDateTime?.toIso8601String(),
        "lastUpdatedDateTime": lastUpdatedDateTime?.toIso8601String(),
        "timezoneId": timezoneId,
        "language": language,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "birthday": birthday,
        "notificationAnyoneYesNo": notificationAnyoneYesNo,
        "notificationYouFollowYesNo": notificationYouFollowYesNo,
        "notificationSocialSomeOneFollowMeYesNo": notificationSocialSomeOneFollowMeYesNo,
        "isBanned": isBanned,
        "bannedDurationId": bannedDurationId,
        "bannedOn": bannedOn,
        "accountDelete": accountDelete,
        "accountDeleteDateTo": accountDeleteDateTo,
        "accountDeletedOn": accountDeletedOn,
        "accountDeletedBy": accountDeletedBy,
        "psnPin": psnPin,
        "profileImageURL": profileImageUrl,
        "bannerImageUrl": bannerImageUrl,
        "userId": userId,
        "onboardingStep": onboardingStep,
        "refreshToken": refreshToken,
        "otp": otp,
        "twoFactorEnabledFor": twoFactorEnabledFor,
        "userRole": userRole?.toJson(),
        "badgeName": badgeName,
        "userBadge": userBadge,
        "normalizedUserName": normalizedUserName,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
    };
}

class UserRole {
    String? id;
    String? name;

    UserRole({
        this.id,
        this.name,
    });

    factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
