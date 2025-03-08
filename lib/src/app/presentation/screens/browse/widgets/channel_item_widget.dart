import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';

class ChannelItemWidget extends StatefulWidget {
  const ChannelItemWidget({
    super.key,
    required this.size,
    required this.browseData,
  });

  final Size size;
  final BrowseModel browseData;

  @override
  State<ChannelItemWidget> createState() => _ChannelItemWidgetState();
}

class _ChannelItemWidgetState extends State<ChannelItemWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: kPadding * 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: Image.network(
                widget.browseData.featuredImg,
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.browseData.title,
                  style: const TextStyle(
                      fontSize: 17,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: kPadding * 2, bottom: kPadding),
                  child: Text(
                    "${widget.browseData.viewers}K viewers",
                    style: const TextStyle(
                        fontSize: 13,
                        color: kLightGreyColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    CustomButton(width: size.width/100 * 15,
                      onPressed: () async {},
                      text: "BR",
                      negativeColor: true,
                    ),
                const SizedBox(width: kPadding ),

                    CustomButton(
                      width: size.width/100 * 15,
                      onPressed: () async {},
                      text: "Action",
                      negativeColor: true,
                    ),
                  ],
                )
              ]),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: isFavorite ? kPrimaryColor : kWhiteColor,
              size: 30,
            ))
      ],
    );
  }
}
