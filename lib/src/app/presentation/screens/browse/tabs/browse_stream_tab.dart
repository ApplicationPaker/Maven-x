import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/screens/browse/widgets/broadcast_item_widget.dart';
import 'package:mavenx/src/data/models/browse_model.dart';
import 'package:mavenx/src/data/models/stream/stream_channel_model.dart';

// ignore: must_be_immutable
class BrowseStreamTab extends StatelessWidget {
  BrowseStreamTab({super.key, required this.isStream});

  bool isStream = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(3, (index) {
        return BroadcastItemWidget(
          streamData: ChannelModel(),
          browseData: browseModel.first,
          isStreaming: isStream? true: false,
        );
      })),
    );
  }
}
