import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mavenx/src/app/presentation/components/Custom_toast_widget.dart';
import 'package:mavenx/src/data/models/stream/stream_channel_model.dart';
import 'package:mavenx/src/data/models/games/top_games_for_dashboard_model.dart';
import 'package:mavenx/src/domain/api/apis_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPro with ChangeNotifier {


  int _currentPage = 1;
  final int _pageSize = 50;
// < ---------------------  FETCH TOP DASHBOARD GAMES FUNCTION --------------------- >
  TopGamesForDashboardModel? topDashboardGamesData;
  bool topDashboardGamesDataIsLoading = false;

  Future<void> fetchTopDashboardGamesFunc(context) async {
    try {
      topDashboardGamesDataIsLoading = true;
      final uri = Uri.parse(
          '$getTopGamesDashboarApi?tag=pubg&pageNo=$_currentPage&pageSize=$_pageSize');
      final headers = {
        'Content-Type': 'application/json',
      };
      final result = await http.get(
        uri,
        headers: headers,
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          TopGamesForDashboardModel dGameModel =
              TopGamesForDashboardModel.fromJson(decodedResponse);
          if (dGameModel.topGamesForDashboard!.isNotEmpty) {
            topDashboardGamesData = dGameModel;

            debugPrint(
                "topDashboardGamesData: ${topDashboardGamesData!.topGamesForDashboard!.length}");
          }
        } else {}
      } else {
        debugPrint("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    topDashboardGamesDataIsLoading = false;
    notifyListeners();
  }

// < ---------------------  FETCH TOP DASHBOARD STREAM FUNCTION --------------------- >
  StreamChannelModel? topDashboardStreamData;
  bool topDashboardStreamDataIsLoading = false;
  Future<void> fetchTopDashboardStreamFunc(context) async {
    try {
      topDashboardStreamDataIsLoading = true;
      // notifyListeners();

      final uri = Uri.parse(getTopStreamDashboarApi);
      final headers = {
        'Content-Type': 'application/json',
      };
      final result = await http.get(
        uri,
        headers: headers,
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          StreamChannelModel dStreamModel = StreamChannelModel.fromJson(
              decodedResponse['topTrendingStreams']);
          if (dStreamModel.channels!.isNotEmpty) {
            topDashboardStreamData = dStreamModel;
          }
        }
      } else {
        debugPrint("No Data Available: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    topDashboardStreamDataIsLoading = false;
    notifyListeners();
  }

  // < ---------------------  FETCH USER PREFERENCES BASED DASHBOARD STREAM FUNCTION --------------------- >
  StreamChannelModel? preferenceBasedDashboardStreamData;
  bool preferenceBasedDashboardStreamDataIsLoading = false;

  Future<void> fetchPreferenceBasedDashboardStreamFunc(context) async {
    try {
      preferenceBasedDashboardStreamDataIsLoading = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userGuidId = prefs.getString('userGuidId');
      debugPrint("userGuidId: $userGuidId");
      final uri = Uri.parse(
          "$getTopStreamOnUserPreferenceDashboarApi?userGuidId=$userGuidId");
      final headers = {
        'Content-Type': 'application/json',
      };
      final result = await http.get(
        uri,
        headers: headers,
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['success'].toString()}");
          StreamChannelModel dStreamModel =
              StreamChannelModel.fromJson(decodedResponse['topChannels']);
          if (dStreamModel.channels!.isNotEmpty) {
            preferenceBasedDashboardStreamData = dStreamModel;
          }
        }
      } else {
        debugPrint("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    preferenceBasedDashboardStreamDataIsLoading = false;
    notifyListeners();
  }
}
