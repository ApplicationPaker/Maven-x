  import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/assets.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

Row likeCommentShareLinkWidget() {
    return Row(
                  children: [
                    // <------------------------  BADGE ------------------------>

                    Container(
                      padding: const EdgeInsets.all(kPadding / 1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius / 2),
                          color: kGreyButtonColor),
                      child: Image.asset(
                        Assets.images.badgePNG,
                        height: 15,
                        width: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: kPadding),
                    const Text(
                      "23",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: kPadding * 2),
                    // <------------------------  COMMENTS ------------------------>
                    Container(
                      padding: const EdgeInsets.all(kPadding / 1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius / 2),
                          color: kGreyButtonColor),
                      child: Image.asset(
                        Assets.images.chatPNG,
                        height: 15,
                        width: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: kPadding),
                    const Text(
                      "6",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: kPadding * 2),
                    // <------------------------  COMMENTS ------------------------>
                    Container(
                      padding: const EdgeInsets.all(kPadding / 1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius / 2),
                          color: kGreyButtonColor),
                      child: Image.asset(
                        Assets.images.sharePNG,
                        height: 15,
                        width: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: kPadding),
                    const Text(
                      "1",
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                     const SizedBox(width: kPadding * 2),
                    // <------------------------  LINK ------------------------>
                    Container(
                      padding: const EdgeInsets.all(kPadding / 1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius / 2),
                          color: kGreyButtonColor),
                      child: Image.asset(
                        Assets.images.linkPNG,
                        height: 15,
                        width: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Spacer(),
                     const Icon(
                                Icons.remove_red_eye,
                                color: kRedColor,
                                size: 20,
                              ),
                              const SizedBox(width: kPadding),
                     const Text(
                                "99 Views",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: kRedColor,
                                    fontWeight: FontWeight.w700),
                              ),
                    
                  ],
                );
  }
