import 'package:flutter/material.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class ChatSocketController extends ChangeNotifier {
  late HubConnection _hubConnection;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<void> connectToChatHub() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl('https://dev-api-gateway-vm.mavenx.gg/chatHub')
        .build();

    _hubConnection.onclose((error) {
      print("Connection closed. Trying to reconnect...");
      _reconnect();
    });

    _hubConnection.on("ReceiveMessage", _handleReceivedMessage);

    try {
      await _hubConnection.start();
      _isConnected = true;
      print("Connected to Chat Hub");
    } catch (error) {
      print("Connection failed: $error");
    }

    notifyListeners();
  }

  Future<void> _reconnect() async {
    await Future.delayed(const Duration(seconds: 5));
    await connectToChatHub();
  }

  void joinStreamingChat({
    required String streamerUserGuid,
    required String streamerUserName,
    required String streamerProfilePic,
    required String streamerChannelId,
    required String streamingId,
    required String streamerUserAchievementBadgeUrl,
    required String viewerGuid,
    required String viewerUserName,
  }) {
    if (_isConnected) {
      _hubConnection.invoke("JoinStreamingChat", args: [
        streamerUserGuid,
        streamerUserName,
        streamerProfilePic,
        streamerChannelId,
        streamingId,
        streamerUserAchievementBadgeUrl,
        viewerGuid,
        viewerUserName,
      ]);
    }
  }

  void sendMessageToStreamingChat({
    required String userGuid,
    required String userName,
    required String profilePic,
    required String channelId,
    required String streamingId,
    required String streamerGuid,
    required String message,
    String? parentMessageId,
    String? parentMessageUsername,
    String? parentMessageContent,
    String? parentMessageUserAchievementBadgeUrl,
    String? parentMessageUserAchievementBadgeTitle,
    String? subscriberBadgeUrl,
    String? userAchievementBadgeUrl,
    String? userAchievementBadgeTitle,
  }) {
    if (_isConnected) {
      _hubConnection.invoke("SendMessageToStreamingChatModel", args: [
        {
          'UserGuid': userGuid,
          'UserName': userName,
          'ProfilePic': profilePic,
          'ChannelId': channelId,
          'StreamingId': streamingId,
          'StreamerGuid': streamerGuid,
          'Message': message,
          'ParentMessageId': parentMessageId,
          'ParentMessageUsername': parentMessageUsername,
          'ParentMessageContent': parentMessageContent,
          'ParentMessageUserAchievementBadgeUrl':
              parentMessageUserAchievementBadgeUrl,
          'ParentMessageUserAchievementBadgeTitle':
              parentMessageUserAchievementBadgeTitle,
          'SubscriberBadgeUrl': subscriberBadgeUrl,
          'UserAchievementBadgeUrl': userAchievementBadgeUrl,
          'UserAchievementBadgeTitle': userAchievementBadgeTitle,
        }
      ]);
    }
  }

  void _handleReceivedMessage(List<dynamic>? parameters) {
    // Handle received message
      debugPrint('Received messagee: $parameters');

    // For example:
    if (parameters != null && parameters.length >= 2) {
      debugPrint('Received message: ${parameters[0]}');
      debugPrint('Received message: ${parameters[0]}');
    }
  }

  @override
  void dispose() {
    if (_isConnected) {
      _hubConnection.stop();
    }
    super.dispose();
  }
}
