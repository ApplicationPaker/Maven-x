import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mavenx/src/app/presentation/components/Custom_toast_widget.dart';
import 'package:mavenx/src/data/models/chat/streaming_page_chat_model.dart';
import 'package:mavenx/src/data/models/stream/streaming_video_details_model.dart';
import 'package:mavenx/src/data/models/stream/streaming_video_model.dart';
import 'package:mavenx/src/domain/api/apis_list.dart';

class StreamPro with ChangeNotifier {
  // < ---------------------  FETCH STREAMING VIDEO FUNCTION --------------------- >
  StreamingVideoModel? streamingVideoData;
  bool streamingVideoDataIsLoading = false;
  Future<void> fetchStreamVideoFunc(String userName, context) async {
    try {
      streamingVideoDataIsLoading = true;
      final uri = Uri.parse("$getStreamingVideoApi?userName=$userName");
      final headers = {'Content-Type': 'application/json'};
      final result = await http.get(uri, headers: headers);
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          StreamingVideoModel streamingVideoModel =
              StreamingVideoModel.fromJson(decodedResponse);
          if (streamingVideoModel.streamingDetails != null) {
            streamingVideoData = streamingVideoModel;
          }
        }
      } else {
        debugPrint("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    streamingVideoDataIsLoading = false;
    notifyListeners();
  }

  // < ---------------------  FETCH STREAMING VIDEO DETAILS FUNCTION --------------------- >
  StreamingVideoDetailModel? streamingVideoDetailsData;
  bool streamingVideoDetailDataIsLoading = false;
  Future<void> fetchStreamVideoDetailFunc(String userName, context) async {
    try {
      streamingVideoDetailDataIsLoading = true;
      final uri = Uri.parse("$getStreamingVideoDetailApi?userName=$userName");
      final headers = {'Content-Type': 'application/json'};
      final result = await http.get(uri, headers: headers);
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          StreamingVideoDetailModel streamingVideoDetailModel =
              StreamingVideoDetailModel.fromJson(decodedResponse);
          if (streamingVideoDetailModel.streamingDetails != null) {
            streamingVideoDetailsData = streamingVideoDetailModel;
          }
        }
      } else {
        debugPrint("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    streamingVideoDetailDataIsLoading = false;
    notifyListeners();
  }

  // < ---------------------  FETCH STREAMING VIDEO CHAT FUNCTION --------------------- >
  StreamingPageChatModel? streamingVideoChatData;
  bool streamingVideoChatDataIsLoading = false;
  Future<void> fetchStreamVideoChatFunc(String streamingId, context) async {
    try {
      streamingVideoChatDataIsLoading = true;
      final uri = Uri.parse("$getStreamingVideoChatApi/$streamingId/1/50");
      final headers = {'Content-Type': 'application/json'};
      final result = await http.get(uri, headers: headers);
      debugPrint("result:* ${result.body}");
      if (result.statusCode == 200) {

        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
      debugPrint("decodedResponse:* ${decodedResponse}");
        if (decodedResponse['success'] == true) {
      debugPrint("decodedResponse['success']:* ${decodedResponse['success']}");
          
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          StreamingPageChatModel streamingVideoChatModel =
              StreamingPageChatModel.fromJson(decodedResponse);
              debugPrint("streamingVideoChatModel:${streamingVideoChatModel.chats}");
          if (streamingVideoChatModel.chats != null) {
            streamingVideoChatData = streamingVideoChatModel;
          }
        }else{
      debugPrint("eseleeeeeeeeeeeeeee*");
          
        }
      } else {
        debugPrint("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    streamingVideoChatDataIsLoading = false;
    notifyListeners();
  }
}
