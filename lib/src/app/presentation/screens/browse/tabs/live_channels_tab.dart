import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/screens/browse/bottomsheet/browse_filters_bottomsheet.dart';
import 'package:mavenx/src/app/presentation/screens/browse/widgets/broadcast_item_widget.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/data/models/browse_model.dart';
import 'package:mavenx/src/data/models/stream/stream_channel_model.dart';

// ignore: must_be_immutable
class LiveChannelsTab extends StatelessWidget {
  const LiveChannelsTab({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (conext) {
                      return SizedBox(
                          height: size.height / 100 * 40,
                          child: const BrowseFiltersBottomsheet());
                    });
              },
              child: Container(
                  width: size.width / 100 * 30,
                  padding: const EdgeInsets.all(kPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kTertiaryColor),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.chart_bar_square),
                      SizedBox(width: kPadding),
                      Text(
                        "Filters",
                        style: TextStyle(
                            fontSize: 13,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            ),
          ),
          Column(
              children: List.generate(3, (index) {
            return BroadcastItemWidget(
          streamData: ChannelModel(),

              browseData: browseModel.first,
              isStreaming: true,
            );
          })),
        ],
      ),
    );
  }
}
