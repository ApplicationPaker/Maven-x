
import 'dart:convert';

StreamingVideoModel streamingVideoModelFromJson(String str) => StreamingVideoModel.fromJson(json.decode(str));

String streamingVideoModelToJson(StreamingVideoModel data) => json.encode(data.toJson());

class StreamingVideoModel {
    bool? success;
    StreamingDetails? streamingDetails;

    StreamingVideoModel({
        this.success,
        this.streamingDetails,
    });

    factory StreamingVideoModel.fromJson(Map<String, dynamic> json) => StreamingVideoModel(
        success: json["success"],
        streamingDetails: json["streamingDetails"] == null ? null : StreamingDetails.fromJson(json["streamingDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "streamingDetails": streamingDetails?.toJson(),
    };
}

class StreamingDetails {
    int? streamId;
    String? userGuidId;
    String? streamUrl;
    String? streamThumbnail;

    StreamingDetails({
        this.streamId,
        this.userGuidId,
        this.streamUrl,
        this.streamThumbnail,
    });

    factory StreamingDetails.fromJson(Map<String, dynamic> json) => StreamingDetails(
        streamId: json["streamId"],
        userGuidId: json["userGuidId"],
        streamUrl: json["streamURL"],
        streamThumbnail: json["streamThumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "streamId": streamId,
        "userGuidId": userGuidId,
        "streamURL": streamUrl,
        "streamThumbnail": streamThumbnail,
    };
}
