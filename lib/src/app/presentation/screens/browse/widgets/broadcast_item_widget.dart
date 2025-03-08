import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/clips/clip_details_screen.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';
import 'package:mavenx/src/data/models/stream/stream_channel_model.dart';

// ignore: must_be_immutable
class BroadcastItemWidget extends StatelessWidget {
  
  BroadcastItemWidget(
      {super.key,
      required this.streamData,
      required this.browseData,
      this.isStreaming = false});
  final BrowseModel browseData;
  final ChannelModel streamData;
  bool isStreaming;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        RouteNavigator.route(context, ClipDetailScreen(streamData: streamData));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPadding),
        child: Container(
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                color: kTertiaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: size.width,
                    height: 250,
                    padding: const EdgeInsets.all(kPadding / 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(streamData.images.toString()),
                            fit: BoxFit.cover)),
                    child: Stack(children: [
                      isStreaming
                          ? Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding,
                                    vertical: kPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                    color: kPrimaryColor),
                                child: const Text(
                                  "LIVE",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding, vertical: kPadding / 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kRadius),
                              color: kBlackColor.withOpacity(0.5)),
                          child: isStreaming
                              ? Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: kPrimaryColor,
                                    ),
                                    const SizedBox(
                                      width: kPadding,
                                    ),
                                    Text(
                                      streamData.maxLiveViews.toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              : const Text(
                                  "39 views",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w400),
                                ),
                        ),
                      ),
                      isStreaming
                          ? const SizedBox()
                          : Positioned(
                              bottom: 5,
                              left: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding,
                                    vertical: kPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                    color: kGreyColor.withOpacity(0.2)),
                                child: const Text(
                                  "2 hours ago",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                      isStreaming
                          ? const SizedBox()
                          : Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding,
                                    vertical: kPadding / 2),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                    color: kGreyColor.withOpacity(0.3)),
                                child: const Text(
                                  "02:10:43",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                    ])),
                const SizedBox(height: kPadding * 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kRadius),
                      child: Image.network(
                        streamData.userBadge.toString(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: kPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            streamData.description.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: kPadding),
                          Text(
                            "${streamData.userName} ● ${streamData.gameName}",
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
                const SizedBox(height: kPadding),
              ],
            )),
      ),
    );
  }
}
