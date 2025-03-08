import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/video_player_widget.dart';
import 'package:mavenx/src/app/presentation/screens/home/widgets/feeds_keyword_widget.dart';
import 'package:mavenx/src/app/presentation/screens/home/widgets/feed_like_comment_share_widget.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

// ignore: must_be_immutable
class FeedsTab extends StatelessWidget {
  FeedsTab({super.key});

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 2, vertical: kPadding),
        child: Column(
          children: [
            const SizedBox(height: kPadding * 2),
            Container(
              padding: const EdgeInsets.all(kPadding * 1.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius),
                  color: kTertiaryColor),
              child: Column(
                children: [
                  // <------------------------  POST ANYTHING ------------------------>

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: kGreyButtonColor,
                            borderRadius: BorderRadius.circular(kRadius),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Post Anything...",
                              hintStyle: TextStyle(
                                color: kLightGreyColor,
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: kPadding),
                          child: Container(
                            padding: const EdgeInsets.all(kPadding * 1.5),
                            decoration: BoxDecoration(
                              color: kGreyButtonColor,
                              borderRadius: BorderRadius.circular(kRadius),
                            ),
                            child: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding),

                  const Row(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: kWhiteColor,
                      ),
                      SizedBox(width: kPadding),
                      Text(
                        "Upload Photo/Video",
                        style: TextStyle(
                            fontSize: 13,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: kPadding * 2),
            // <------------------------  FEEDS ------------------------>
            Column(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: Container(
                    padding: const EdgeInsets.all(kPadding * 1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadius),
                        color: kTertiaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(kRadius),
                              child: Image.network(
                                "https://th.bing.com/th/id/R.35720bbf29a0f0f1d48195bafdbedf7a?rik=1ArMFF%2fGA8AK1g&riu=http%3a%2f%2fshmector.com%2f_ph%2f13%2f188552034.png&ehk=4W3VAJ3Rgszg4unVrkViPToNE%2b15%2bt3SxRm%2b2VYCdIk%3d&risl=&pid=ImgRaw&r=0",
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: kPadding * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "SEF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(width: kPadding),
                                    Container(
                                      padding:
                                          const EdgeInsets.all(kPadding / 1.5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              kRadius / 2),
                                          color: kPrimaryColor),
                                      child: Image.asset(
                                        Assets.images.badgePNG,
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: kPadding),
                                const Text(
                                  "30 mins ago",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kLightGreyColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  height: size.height / 100 * 4,
                                  child: CustomButton(
                                    onPressed: () async {},
                                    text: "Follow",
                                    negativeColor: true,
                                    showLoading: showLoading,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: kPadding),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: kWhiteColor,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: kPadding),

                        CustomVideoPlayerWidget(
                            videoUrl:
                                "https://assets.mixkit.co/videos/preview/mixkit-a-young-woman-with-kitty-headphones-enjoys-a-gaming-session-51623-large.mp4"),
                        const SizedBox(height: kPadding * 1.5),
                        // <------------------------  LIKE COMMENT SHARE LINK VIEWS ------------------------>
                        likeCommentShareLinkWidget(),
                        const SizedBox(height: kPadding * 2.5),
                        // <------------------------  KEYWORDS ------------------------>
                        feedsKeywordWidget(),
                        const Divider(color: kLightGreyColor, height: 30),
                        const Text(
                          "View all 4 Comments",
                          style: TextStyle(
                              fontSize: 13,
                              color: kRedColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: kPadding),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: kPadding),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kRadius),
                                child: Image.network(
                                  "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?cs=srgb&dl=pexels-creation-hill-1681010.jpg&fm=jpg",
                                  height: 45,
                                  width: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: kGreyButtonColor,
                                  borderRadius: BorderRadius.circular(kRadius),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Write something...",
                                    hintStyle: TextStyle(
                                      color: kLightGreyColor,
                                      fontSize: 14,
                                    ),
                                    suffixIcon: SizedBox(
                                      width: 70,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.emoji_emotions_outlined,
                                            color: kLightGreyColor,
                                            size: 30,
                                          ),
                                          SizedBox(width: kPadding / 2),
                                          Icon(
                                            Icons.gif_box_outlined,
                                            color: kLightGreyColor,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(8.0),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: kPadding),
                                child: Container(
                                  padding: const EdgeInsets.all(kPadding * 1.5),
                                  decoration: BoxDecoration(
                                    color: kGreyButtonColor,
                                    borderRadius:
                                        BorderRadius.circular(kRadius),
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: kPrimaryColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
