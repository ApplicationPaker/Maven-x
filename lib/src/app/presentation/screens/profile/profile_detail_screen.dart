
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_text_field.dart';
import 'package:mavenx/src/app/presentation/config/app_constants.dart';
import 'package:mavenx/src/app/presentation/config/extensions/edge_insects_extension.dart';
import 'package:mavenx/src/app/presentation/config/extensions/sizedbox_extension.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_tabs/about_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_tabs/chat_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_tabs/feed_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_tabs/games_tab_screen.dart';
import 'package:mavenx/src/app/presentation/screens/profile/profile_tabs/videos_tab_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:video_player/video_player.dart';


class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> with SingleTickerProviderStateMixin{

  final TextEditingController searchController = TextEditingController() ;

  late TabController tabController;


  // List<ProfileTabs> tabsList = [
  //   ProfileTabs.about,
  //   ProfileTabs.chat,
  //   ProfileTabs.feed,
  //   ProfileTabs.games,
  //   ProfileTabs.videos,
  //   ProfileTabs.statistics
  // ] ;
  //
  // int selectedTab = 1 ;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    initializePlayer();
    //-- video player
    // videoPlayerController = VideoPlayerController.networkUrl(Uri(
    //   path:
    //       "https://assets.mixkit.co/videos/preview/mixkit-waves-coming-to-the-beach-5016-large.mp4",
    // ));
    // videoPlayerController = VideoPlayerController.network(
    //   "https://www.youtube.com/watch?v=e6vaOyR3olY",
    // );

    // videoPlayerController.addListener(() {
    //   setState(() {});
    // });
    // videoPlayerController.setLooping(true);
    // videoPlayerController.initialize().then((_) => setState(() {}));
    // videoPlayerController.play();
  }

  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(
        "https://assets.mixkit.co/videos/preview/mixkit-a-young-woman-with-kitty-headphones-enjoys-a-gaming-session-51623-large.mp4"));

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
    var width = AppConstants.mediaWidth(context) ;
    var height = AppConstants.mediaHeight(context) ;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            backgroundColor: kDarkBackgroundColor,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                InkWell(
                  onTap: ()=> Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: kWhiteColor,
                  ),
                ),

                10.sw,

                Expanded(
                  child: CustomTextField(
                    controller: searchController,
                    fillColor: kDarkGreyColor.withOpacity(0.4),
                  ),
                ),

              ],
            ),
            floating: true,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  //0.28 height
                  SizedBox(
                    width: width,
                    height: height * 0.28,
                    child: Center(
                      child: _chewieController != null &&
                          _chewieController!.videoPlayerController.value.isInitialized
                          ? Chewie(
                        controller: _chewieController!,
                      )
                          : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      ),
                    ),
                  ),

                  //profile 0.13 height
                  Padding(
                    padding: 10.allEdge,
                    child: Container(
                      padding: 12.allEdge,
                      height: height * 0.13,
                      width: width,
                      decoration: BoxDecoration(
                          color: kTileColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                          )
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                        
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        Assets.images.appLogo
                                    ),
                                  ),
                                ),
                        
                                10.sw,
                        
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                        
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                        
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              "Shazam",
                                              textScaler: TextScaler.linear(1.1),
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                  color: kWhiteColor
                                              ),
                                            ),
                                          ),
                        
                                          10.sw,
                        
                                          Image(
                                              height: 18,
                                              width: 18,
                                              fit: BoxFit.fill,
                                              image: AssetImage(Assets.images.smallLogoPNG)
                                          )
                        
                                        ],
                                      ),
                        
                                      5.sh,
                        
                                      Text(
                                        "Member since : 21-12-2021",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            color: kWhiteColor.withOpacity(1)
                                        ),
                                      )
                        
                                    ],
                                  ),
                                ),
                        
                        
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                        
                                    showSmallBox(
                                        onTap: (){},
                                        background: kRedColor,
                                        image: Assets.images.editPNG
                                    ),
                        
                                    8.sh,
                        
                                    showSmallBox(
                                        onTap: (){},
                                        background: kGreyColor,
                                        image: Assets.images.sharePNG
                                    ),
                        
                                  ],
                                ),
                        
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ),

                  //0.06 height
                  TabBar(
                    // physics: const AlwaysScrollableScrollPhysics(),
                    isScrollable: false,
                    tabAlignment: TabAlignment.fill,
                    // labelPadding: 30.rightEdge,
                    controller: tabController,
                    indicatorWeight: 5,
                    indicatorColor: kPrimaryColor,
                    labelColor: kWhiteColor,
                    unselectedLabelColor: kLightGreyColor.withOpacity(0.7),
                    labelStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                    tabs: [
                      getTab("ABOUT"),
                      getTab("CHAT"),
                      // getTab("FEED"),
                      getTab("GAMES"),
                      getTab("VIDEOS"),

                    ],
                  ),

                  Divider(
                    color: kWhiteColor.withOpacity(0.8),
                    height: 0,
                    thickness: 0.8,
                  ),


                  Container(
                    height: (height * 0.53) - kToolbarHeight - (MediaQuery.of(context).padding.top) - (MediaQuery.of(context).padding.bottom),
                    padding: 10.allEdge,
                    child: TabBarView(
                      controller: tabController,
                      children: [

                        AboutTabScreen(),
                        ChatTabScreen(),
                        // FeedTabScreen(),
                        GamesTabScreen(),
                        VideosTabScreen(),
                        // StatisticsTabScreen(),

                      ],
                    ),
                  ),
                ]
              )
          )
        ],
      ),
    ) ;

  }


  Widget showSmallBox({required VoidCallback onTap, required Color background, required String image}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: 0.customSymmetric(horizontal: 10,verticle: 8),
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Image(
            height: 18,
            width: 18,
            fit: BoxFit.fill,
            image: AssetImage(
                image
            )
        ),
      ),
    ) ;
  }

  Widget getTabScreen(int id) {

    if(id == 1) {
      return AboutTabScreen() ;
    }
    else if(id == 2) {
      return ChatTabScreen() ;
    }
    else if(id == 3) {
      return FeedTabScreen() ;
    }
    else if(id == 4) {
      return GamesTabScreen() ;
    }
    else if(id == 5) {
      return VideosTabScreen() ;
    }
    // else if(id == 6) {
    //   return StatisticsTabScreen() ;
    // }
    else {
      return AboutTabScreen() ;
    }

  }


  Widget getTab(String title) {
    return Tab(
      text: title,
    ) ;
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    searchController.dispose() ;
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


}
