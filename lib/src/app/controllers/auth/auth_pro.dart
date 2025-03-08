import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/presentation/components/Custom_toast_widget.dart';
import 'package:mavenx/src/app/presentation/navbar/bottom_navbar.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/forgot_password/email_verified_screen.dart';
import 'package:mavenx/src/app/presentation/screens/auth/forgot_password/verify_email_screen.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/add_bio_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_avatar_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/select_favorite_person_step.dart';
import 'package:mavenx/src/app/presentation/screens/auth/registration/steps_completed_screen.dart';
import 'package:mavenx/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:mavenx/src/app/presentation/utils/custom_loading_dialog.dart';
import 'package:mavenx/src/data/models/favorite_games_model.dart';
import 'package:mavenx/src/data/models/favorite_person_model.dart';
import 'package:mavenx/src/data/models/user_channel_following_by_userguide_model.dart';
import 'package:mavenx/src/data/models/user_channel_model.dart';
import 'package:mavenx/src/data/models/user_details_model.dart';
import 'package:mavenx/src/data/models/user_favorite_game_by_userguide_model.dart';
import 'package:mavenx/src/domain/api/apis_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPro with ChangeNotifier {
// < ---------------------  LOGIN FUNCTION --------------------- >
  accountLoginFunc(String email, String password, context) async {
    try {
      showLoadingDialog(context);
      Map<String, dynamic> body = {
        'username': email,
        'password': password,
        "rememberMe": true
      };

      final uri = Uri.parse(accLoginApi);

      final headers = {
        'Content-Type': 'application/json',
      };

      final result = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      debugPrint("result.statusCode: ${result.statusCode}");
      if (result.statusCode == 200) {
        Map<String, dynamic> response = jsonDecode(result.body);

        if (response['success'].toString() == 'false') {
        Navigator.pop(context);
        showMyCustomSnackBar(response['errorMessage'].toString(), true, context);

          debugPrint("status: True");
          debugPrint("Error Message: ${response['errorMessage'].toString()}");
        } else if (response['success'].toString() == 'true') {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
// < ---------------------  STORING USER CREDNTIALS --------------------- >
          await prefs.setString(
              'userFullName', response['userFullName'].toString());
          await prefs.setString('username', response['username'].toString());
          await prefs.setString(
              'userGuidId', response['userGuidId'].toString());

          await prefs.setString('role', response['role'].toString());

          await prefs.setString('token', response['token'].toString());

          log("userFullName: ${response['userFullName'].toString()}");
          log("username: ${response['username'].toString()}");
          log("userGuidId: ${response['userGuidId'].toString()}");
          log("role: ${response['role'].toString()}");
          log("token: ${response['token'].toString()}");

          getCurrentUserDetailsFunc(context);
// < ---------------------  CHECKING CONDITION ONBOARDING COMPLETED OR NOT --------------------- >
          if (response['onBoardingCompleted'] == true) {
            RouteNavigator.replacementroute(
                context, BottomNavBar(selectedTab: 0));
          } else {
            RouteNavigator.replacementroute(context, const VerifyEmailScreen());
          }
        }
      } else {
        Navigator.pop(context);
        showMyCustomSnackBar("Please Try again.", false, context);
      }
    } catch (e) {
      Navigator.pop(context);
      showMyCustomSnackBar("Exeption Caught: $e.", false, context);
    }
    notifyListeners();
  }

// < ---------------------  SIGNUP FUNCTION --------------------- >
  accountSignupFunc(String fullName, String userName, String email,
      String password, String contactNo, context) async {
    try {
      showLoadingDialog(context);
      Map<String, dynamic> body = {
        'fullName': fullName,
        'userName': userName,
        "email": email,
        "password": password,
        "contactNo": "+92 $contactNo"
      };

      final uri = Uri.parse(accRegisterApi);

      final headers = {
        'Content-Type': 'application/json',
      };

      final result = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> response = jsonDecode(result.body);

        if (response['success'].toString() == 'false') {
          debugPrint("status: false");
          debugPrint("Error Message: ${response['errorMessage'].toString()}");
          Navigator.pop(context);
          showMyCustomSnackBar(
              response['errorMessage'].toString(), true, context);
        } else if (response['success'].toString() == 'true') {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
// < ---------------------  STORING USER CREDNTIALS --------------------- >
          await prefs.setString(
              'userFullName', response['userFullName'].toString());
          await prefs.setString('username', response['username'].toString());
          await prefs.setString(
              'userGuidId', response['userGuidId'].toString());
          await prefs.setString('token', response['token'].toString());
          await prefs.setString(
              'refreshToken', response['refreshToken'].toString());
          log("userFullName: ${response['userFullName'].toString()}");
          log("username: ${response['username'].toString()}");
          log("userGuidId: ${response['userGuidId'].toString()}");
          log("token: ${response['token'].toString()}");
          log("refreshToken: ${response['refreshToken'].toString()}");

          // getCurrentUserData();

          RouteNavigator.replacementroute(
              context, BottomNavBar(selectedTab: 0));
        }
      } else {
        Navigator.pop(context);
        showMyCustomSnackBar("Please Try again.", false, context);
      }
    } catch (e) {
      Navigator.pop(context);
      showMyCustomSnackBar("Exeption Caught: $e.", true, context);
    }
    notifyListeners();
  }

// < ---------------------  GET CURRENT USER DETAILS FUNCTION --------------------- >

  bool userCurrentDataIsLoading = false;
  String userCurrentFullName = "";
  UserDetailsModel? userDetailData;
  Future<void> getCurrentUserDetailsFunc(context) async {
    userCurrentFullName = "";

    userCurrentDataIsLoading = true;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(getCurrentUserDetailsApi);

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(uri, headers: headers);
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          UserDetailsModel cartModel =
              UserDetailsModel.fromJson(decodedResponse);

          userDetailData = cartModel;

          debugPrint("User Email: ${userDetailData!.user!.email}");
          debugPrint(
              "User emailConfirmed: ${userDetailData!.user!.emailConfirmed}");

          notifyListeners();
        } else {}
      } else {
        log("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }

    userCurrentDataIsLoading = false;
    notifyListeners();
  }

// < ---------------------  SEND VERIFICATION CODE TO EMAIL FUNCTION --------------------- >
  Future<void> sendEmailVerificationCodeFunc(String userEmail, context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(sendEmailVerificationCodeApi);
      Map<String, dynamic> body = {
        'email': userEmail,
      };
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          debugPrint("Code Sent: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  VERIFY OTP CODE FUNCTION --------------------- >
  Future<void> verifyOTPCodeFunc(String userEmail, String otp, context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(verifyOTPCodeApi);
      Map<String, dynamic> body = {
        "emailAddress": userEmail,
        "phoneNumber": "5",
        "otp": otp
      };
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Code Sent: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
          Navigator.popUntil(context, (route) => route.isFirst);
          RouteNavigator.replacementroute(context, const EmailVerifiedScreen());
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");

          showMyCustomSnackBar(
              decodedResponse['errorMessage'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  UPDATE BIRTHDAY FUNCTION --------------------- >
  Future<void> updateBirthdayFunc(
      String year, String month, String date, context) async {
    try {
      final stepData = Provider.of<StepperPro>(context, listen: false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(updateBirthdayApi);
      Map<String, dynamic> body = {
        "dateOfBirth": "$year-$month-${date}T19:28:26.049Z",
      };
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Code Sent: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
          stepData.goToStep(2);

          RouteNavigator.route(context, const SelectAvatarStep());
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");

          showMyCustomSnackBar(
              decodedResponse['errorMessage'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  SEARCH FAVORITE GAME FUNCTION --------------------- >
  FavoriteGamesModel? favoriteGameData;
  bool favoriteGameIsLoading = false;

  Future<void> searchFavoriteGameFunc(
      String? searchedGameTitle, context) async {
    try {
      debugPrint(
          "------------------- searchFavoriteGameFunc ---------------------");
      favoriteGameIsLoading = true;
      notifyListeners();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(searchFavortieGameApi + (searchedGameTitle ?? ""));

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(
        uri,
        headers: headers,
      );
      debugPrint("result.statusCode: ${result.statusCode}");

      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        // debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Code Sent: ${decodedResponse['message'].toString()}");
          FavoriteGamesModel fvtGameModel =
              FavoriteGamesModel.fromJson(decodedResponse);

          favoriteGameData = fvtGameModel;

          debugPrint("Game Name: ${favoriteGameData!.games![0].gameName}");
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      // showMyCustomSnackBar("Catch Execption: $e.", true, context);
      debugPrint("Catch Execption: $e.");
    }
    favoriteGameIsLoading = false;
    notifyListeners();
  }

// < ---------------------  UPDATE FACORITE GAME FUNCTION --------------------- >
  Future<void> updateFavoriteGameFunc(List<int> fvtGameIds, context) async {
    try {
      final stepData = Provider.of<StepperPro>(context, listen: false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(updateFavortieGameApi);
      Map<String, dynamic> body = {"favoriteGames": fvtGameIds.toList()};
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
          stepData.goToStep(4);

          RouteNavigator.route(context, const SelectFavoritePersonStep());
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");

          showMyCustomSnackBar(
              decodedResponse['errorMessage'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  SEARCH FAVORITE PERSON FUNCTION --------------------- >
  FavoritePersonModel? favoritePersonData;
  bool favoritePersonIsLoading = false;

  Future<void> searchFavoritePersonFunc(
      String? searchedPersonTitle, context) async {
    try {
      debugPrint(
          "------------------- searchFavoriteGameFunc ---------------------");
      favoritePersonIsLoading = true;
      notifyListeners();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(
          "$searchFavortiePersonApi=$searchedPersonTitle&pageNo=1&pageSize=50");

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(
        uri,
        headers: headers,
      );
      debugPrint("result.statusCode: ${result.statusCode}");

      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        // debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Code Sent: ${decodedResponse['message'].toString()}");
          FavoritePersonModel fvtGameModel =
              FavoritePersonModel.fromJson(decodedResponse);

          favoritePersonData = fvtGameModel;

          debugPrint(
              "Person Name: ${favoritePersonData!.userChannelFollowings![0].displayName}");
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      debugPrint("Catch Execption: $e.");
    }
    favoritePersonIsLoading = false;
    notifyListeners();
  }

// < ---------------------  UPDATE FAVORITE PERSON FUNCTION --------------------- >
  Future<void> updateFavoritPersonFunc(
      List<String> fvtPersonIds, context) async {
    try {
      final stepData = Provider.of<StepperPro>(context, listen: false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(updateFavoritePersonApi);
      Map<String, dynamic> body = {"followingUsers": fvtPersonIds.toList()};
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
          stepData.goToStep(5);

          RouteNavigator.route(context, const AddBioStep());
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");

          showMyCustomSnackBar(
              decodedResponse['errorMessage'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  GET  USER CHANNEL DETAILS FUNCTION --------------------- >

  bool userChannelDataIsLoading = false;

  UserChannelModel? userChannelData;
  Future<void> getUserChannelDetailsFunc(String channelGuidId, context) async {
    userChannelDataIsLoading = true;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse("$getUserChannelDetailsApi/$channelGuidId");

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(uri, headers: headers);
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          UserChannelModel channelModel =
              UserChannelModel.fromJson(decodedResponse);

          userChannelData = channelModel;

          debugPrint(
              "User Channel displayName: ${userChannelData!.channel!.displayName}");

          notifyListeners();
        } else {}
      } else {
        log("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }

    userChannelDataIsLoading = false;
    notifyListeners();
  }

// < ---------------------  UPDATE USER BIO FUNCTION --------------------- >
  Future<void> updateUserBioFunc(String userBio, context) async {
    try {
      final stepData = Provider.of<StepperPro>(context, listen: false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(updateUserBioApi);
      Map<String, dynamic> body = {"bio": userBio};
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);
        debugPrint("decodedResponse: $decodedResponse");

        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);
          stepData.goToStep(6);

          RouteNavigator.route(context, const StepsCompletedScreen());
        } else {
          debugPrint("errorMsg: ${decodedResponse['errorMessage'].toString()}");

          showMyCustomSnackBar(
              decodedResponse['errorMessage'].toString(), false, context);
        }
      } else {
        log("Failed to Load Status Code: ${result.statusCode}");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }
  }

// < ---------------------  GET  USER FAVORITE GAMES DETAILS FUNCTION --------------------- >

  bool userFavoriteDataIsLoading = false;

  UserFavoriteGameByUserGuidModel? userFavoriteGameData;
  Future<void> getUserFavoriteGameslDetailsByUserGuidIdFunc(
      String userGuidId, context) async {
    userFavoriteDataIsLoading = true;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse("$getUserFavoriteGamesDetailApi/$userGuidId");

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(uri, headers: headers);
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          UserFavoriteGameByUserGuidModel channelModel =
              UserFavoriteGameByUserGuidModel.fromJson(decodedResponse);

          userFavoriteGameData = channelModel;

          notifyListeners();
        } else {}
      } else {
        log("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }

    userFavoriteDataIsLoading = false;
    notifyListeners();
  }

// < ---------------------  GET  USER FAVORITE GAMES DETAILS FUNCTION --------------------- >

  bool userChannelFollowingDataIsLoading = false;

  UserChannelFollowingByUserGuidModel? userChannelFollowingData;
  Future<void> getUserChannelFollowingDetailsByUserGuidIdFunc(
      String userGuidId, context) async {
    userChannelFollowingDataIsLoading = true;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse("$getUserChannelFollowingDetailApi/$userGuidId");

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.get(uri, headers: headers);
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          UserChannelFollowingByUserGuidModel channelModel =
              UserChannelFollowingByUserGuidModel.fromJson(decodedResponse);

          userChannelFollowingData = channelModel;

          notifyListeners();
        } else {}
      } else {
        log("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }

    userChannelFollowingDataIsLoading = false;
    notifyListeners();
  }

// < ---------------------  LAST STEP VERIFY DETAILS FUNCTION --------------------- >

  Future<void> lastStepVerifyDetailsFunc(context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? userToken = prefs.getString('token');
      final uri = Uri.parse(lastStepVerifyDetailsApi);

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      };
      final result = await http.put(uri, headers: headers);
      debugPrint("result.statusCode: ${result.statusCode}");
      debugPrint("result: $result");
      if (result.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(result.body);

        if (decodedResponse['success'] == true) {
          debugPrint("Message: ${decodedResponse['message'].toString()}");
          showMyCustomSnackBar(
              decodedResponse['message'].toString(), false, context);

          RouteNavigator.replacementroute(context, const SplashScreen());
        } else {}
      } else {
        log("No Data: ");
      }
    } catch (e) {
      showMyCustomSnackBar("Catch Execption: $e.", true, context);
    }

    notifyListeners();
  }
}
