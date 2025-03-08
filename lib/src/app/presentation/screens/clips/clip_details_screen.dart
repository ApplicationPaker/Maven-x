import 'package:chewie/chewie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/chat/chat_socket_controller.dart';
import 'package:mavenx/src/app/controllers/stream/stream_pro.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/auth/login_screen.dart';
import 'package:mavenx/src/app/presentation/screens/clips/dialogs/report_type_dialog.dart';
import 'package:mavenx/src/app/presentation/screens/clips/dialogs/video_quality_dialog.dart';
import 'package:mavenx/src/app/presentation/screens/payment_methods/payment_methods_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/comments_model.dart';
import 'package:mavenx/src/data/models/stream/stream_channel_model.dart';
import 'package:provider/provider.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:video_player/video_player.dart';

class ClipDetailScreen extends StatefulWidget {
  const ClipDetailScreen({
    super.key,
    required this.streamData,
  });
  final ChannelModel streamData;

  @override
  State<ClipDetailScreen> createState() => _ClipDetailScreenState();
}

class _ClipDetailScreenState extends State<ClipDetailScreen> {
  bool showLoading = false;
  late HubConnection _hubConnection;
  bool isConnected = false;

  int totalViews = 0;

  late ChatSocketController _chatController;

  @override
  void initState() {
    super.initState();
    Provider.of<StreamPro>(context, listen: false).fetchStreamVideoDetailFunc(
        widget.streamData.userName.toString(), context);
        Provider.of<StreamPro>(context, listen: false).fetchStreamVideoChatFunc(
        "12967", context);
    initializePlayer();
    //sockets
    _connectToHub();
    // Initialize ChatSocketController here
    _initializeChatSocket();
  }

  void _initializeChatSocket() {
    _chatController = ChatSocketController();
    _chatController.connectToChatHub();
  }

//join chat
  void joinStreamingChat() {
    // Get required data to join streaming chat from your state or widget properties
    String streamerUserGuid =
        'aed1bd22-08fe-45cc-a055-0e9551ddcb2c'; // Fill in with the streamer user guid
    String streamerUserName = 'tabu'; // Fill in with the streamer user name
    String streamerProfilePic =
        'https://mavenx-test.s3.eu-north-1.amazonaws.com/image/0615fc22f547477e9f38fd7a00b3968c'; // Fill in with the streamer profile pic URL
    String streamerChannelId = '15084'; // Fill in with the streamer channel id
    String streamingId = '12967'; // Fill in with the streaming id
    String streamerUserAchievementBadgeUrl =
        'https://mavenx-test.s3.eu-north-1.amazonaws.com/image/5c7a132f44fc4491b836940ea883bc33.png'; // Fill in with the streamer user achievement badge URL
    String viewerGuid =
        '48d88caf-ea42-4caf-bc59-5f36638aa6b6'; // Fill in with the viewer guid
    String viewerUserName = 'mrhassyy'; // Fill in with the viewer user name

    // Join streaming chat
    Provider.of<ChatSocketController>(context, listen: false).joinStreamingChat(
      streamerUserGuid: streamerUserGuid,
      streamerUserName: streamerUserName,
      streamerProfilePic: streamerProfilePic,
      streamerChannelId: streamerChannelId,
      streamingId: streamingId,
      streamerUserAchievementBadgeUrl: streamerUserAchievementBadgeUrl,
      viewerGuid: viewerGuid,
      viewerUserName: viewerUserName,
    );
  }

  final TextEditingController _messageController = TextEditingController();

  void sendMessageToStreamingChat() {
    // Get required data to send message from your state or widget properties
    String userGuid =
        '48d88caf-ea42-4caf-bc59-5f36638aa6b6'; // Fill in with the user guid
    String userName = 'mrhassyy'; // Fill in with the user name
    String profilePic =
        'https://mavenx-test.s3.eu-north-1.amazonaws.com/image/0615fc22f547477e9f38fd7a00b3968c'; // Fill in with the profile pic URL
    String channelId = '15084'; // Fill in with the channel id
    String streamingId = '12967'; // Fill in with the streaming id
    String streamerGuid =
        'aed1bd22-08fe-45cc-a055-0e9551ddcb2c'; // Fill in with the streamer guid
    String message =
        _messageController.text; // Get message from text controller

    // Send message to streaming chat
    Provider.of<ChatSocketController>(context, listen: false)
        .sendMessageToStreamingChat(
      userGuid: userGuid,
      userName: userName,
      profilePic: profilePic,
      channelId: channelId,
      streamingId: streamingId,
      streamerGuid: streamerGuid,
      message: message,
    );

    // Clear the message text field
    _messageController.clear();
  }
//

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    //sockets
    _leaveStreaming();
    _hubConnection.stop();
    //cjat
    _chatController.dispose();
    super.dispose();
  }

  Future<void> _connectToHub() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl('https://dev-api-gateway-vm.mavenx.gg/streamHub')
        .build();

    _hubConnection.onclose((error) {
      print("Connection closed. Trying to reconnect...");
      _reconnect();
    });

    _hubConnection.on("getStreamLiveViewers", _handleStreamLiveViewers);

    await _hubConnection.start().then((_) {
      setState(() {
        isConnected = true;
      });
      print("Connected to SignalR Hub");
      _addStreamViewer();
    }).catchError((error) {
      print("Connection failed: $error");
    });
  }

  Future<void> _reconnect() async {
    await Future.delayed(const Duration(seconds: 5));
    await _connectToHub();
  }

  void _handleStreamLiveViewers(List<dynamic>? parameters) {
    if (parameters != null && parameters.length >= 2) {
      print('parameters.length: ${parameters.length}');
      print('parameters: ${parameters[0]}');
      print('parameters: ${parameters[1]}');
      setState(() {
        totalViews = parameters[1];
      });
    }
  }

  void _addStreamViewer() {
    if (isConnected) {
      debugPrint("IsConnected");
      _hubConnection.invoke("AddStreamViewer", args: [
        'aed1bd22-08fe-45cc-a055-0e9551ddcb2c',
        '12967',
        'aed1bd22-08fe-45cc-a055-0e9551ddcb2caed1bd22-08fe-45cc-a055-0e9551ddcb2caed1bd22-08fe-45cc-a055-0e9551ddcb2c',
        'true'
      ]);
    }
  }

  void _leaveStreaming() {
    if (isConnected) {
      _hubConnection.invoke("LeaveStreaming");
    }
  }

  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  Future<void> initializePlayer() async {
    final streamPro = Provider.of<StreamPro>(context, listen: false);
    await streamPro.fetchStreamVideoFunc(
        widget.streamData.userName.toString(), context);

    _videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(
        streamPro.streamingVideoData!.streamingDetails!.streamUrl.toString()));

    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;

    await initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kPadding, horizontal: kPadding * 2),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: kGreyButtonColor,
            borderRadius: BorderRadius.circular(kRadius * 2),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your message here",
                    hintStyle: TextStyle(
                      color: kLightGreyColor,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: kLightGreyColor,
                    ),
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
              InkWell(
                onTap: sendMessageToStreamingChat,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: kWhiteColor,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: kPadding * 2),

              Consumer<StreamPro>(builder: (context, streamValue, child) {
                if (streamValue.streamingVideoDataIsLoading) {
                  return SizedBox(
                      width: size.width,
                      height: size.height / 100 * 30,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (streamValue.streamingVideoData != null) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height / 100 * 30,
                        child: Center(
                          child: _chewieController != null &&
                                  _chewieController!
                                      .videoPlayerController.value.isInitialized
                              ? Stack(
                                  children: [
                                    Chewie(
                                      controller: _chewieController!,
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 20,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kPadding,
                                            vertical: kPadding / 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(kRadius),
                                            color: kPrimaryColor),
                                        child: Text(
                                          "$totalViews LIVE",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20),
                                    Text(
                                      'Buffering...',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding: const EdgeInsets.only(right: kPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (conext) {
                                        return SizedBox(
                                            height: size.height / 100 * 85,
                                            child: const ReportTypeDialog());
                                      });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(kPadding / 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(kRadius),
                                        color: kWhiteColor.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.report_gmailerrorred,
                                      color: kWhiteColor,
                                      size: 18,
                                    )),
                              ),
                              const SizedBox(width: kPadding),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (conext) {
                                        return SizedBox(
                                            height: size.height / 100 * 60,
                                            child: const VideoQualityDialog());
                                      });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(kPadding / 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(kRadius),
                                        color: kWhiteColor.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.settings,
                                      color: kWhiteColor,
                                      size: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdni.iconscout.com/illustration/premium/thumb/boy-showing-folder-with-no-data-10962340-8881964.png",
                        fit: BoxFit.cover,
                        height: 250,
                        width: 250,
                      ),
                      const Text(
                        "No Live Stream Available",
                        style: TextStyle(
                            fontSize: 15,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                }
              }),
              const SizedBox(height: kPadding * 2),
              // <------------------------  STREAMING USER DETAIL SECTION ------------------------>
              Consumer<StreamPro>(builder: (context, streamValue, child) {
                if (streamValue.streamingVideoDataIsLoading) {
                  return SizedBox(
                      width: size.width,
                      height: size.height / 100 * 30,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (streamValue.streamingVideoData != null) {
                  return Container(
                    padding: const EdgeInsets.all(kPadding * 2),
                    decoration: const BoxDecoration(
                        color: kTertiaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(kRadius * 2),
                            bottomRight: Radius.circular(kRadius * 2))),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(kRadius),
                              child: Image.network(
                                streamValue.streamingVideoDetailsData!
                                    .streamingDetails!.profileImageUrl
                                    .toString(),

                                height: 55,
                                width: 50,
                                // fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: kPadding),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    streamValue.streamingVideoDetailsData!
                                        .streamingDetails!.description
                                        .toString(),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: kPadding / 2),
                                  Text(
                                    "${streamValue.streamingVideoDetailsData!.streamingDetails!.userName} ● ${streamValue.streamingVideoDetailsData!.streamingDetails!.gameName} ● $totalViews views",
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: kLightGreyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kPadding * 1.5),

                        // <------------------------  BUTTONS ------------------------>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding / 2),
                                child: CustomButton(
                                  onPressed: () async {
                                    RouteNavigator.route(
                                        context, const LoginScreen());

                                    // showModalBottomSheet(
                                    //     isScrollControlled: true,
                                    //     context: context,
                                    //     builder: (conext) {
                                    //       return SizedBox(
                                    //           height: size.height / 100 * 65,
                                    //           child: const LoginScreen());
                                    //     });
                                  },
                                  text: "Follow",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding / 2),
                                child: CustomButton(
                                  onPressed: () async {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (conext) {
                                          return SizedBox(
                                              height: size.height / 100 * 60,
                                              child:
                                                  const PaymentMethodsScreen());
                                        });
                                    //  RouteNavigator.route(
                                    //       context, const PaymentMethodsScreen());
                                  },
                                  text: "Subscribe",
                                  negativeColor: true,
                                  showLoading: showLoading,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text(
                    "No Data Available",
                    style: TextStyle(
                        fontSize: 15,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500),
                  );
                }
              }),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kPadding * 3),

                    // <------------------------  Comments ------------------------>
                  Consumer<StreamPro>(builder: (context, streamChatValue, child) {
                if (streamChatValue.streamingVideoChatDataIsLoading) {
                  return SizedBox(
                      width: size.width,
                      height: size.height / 100 * 30,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (streamChatValue.streamingVideoChatData!.chats!.isNotEmpty) {

                  return  SingleChildScrollView(
                      child: Column(
                        children: List.generate(streamChatValue.streamingVideoChatData!.chats!.length, (index) {
                          var commentData = streamChatValue.streamingVideoChatData!.chats![index];
                          return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(kRadius),
                                child: Image.network(
                                  commentData.profilePicture.toString(),
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text.rich(
                                TextSpan(
                                  text: "${commentData.userName}: ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {},
                                      text: commentData.chatContent.toString(),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ));
                        }),
                      ),
                    );

                }else{
                   return const Text(
                    "No Chat Data Available",
                    style: TextStyle(
                        fontSize: 15,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500),
                  );
                } }),

                   
                    SizedBox(height: kPadding),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
