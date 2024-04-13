import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:uniqcast/functions/percent_size.dart';
import 'package:uniqcast/modules/channels/channels_list_view.dart';
import 'package:uniqcast/modules/channels/state/channel_stream_state.dart';

class ChannelStreamPageArgs {
  final int id;
  const ChannelStreamPageArgs(this.id);
}

class ChannelStreamPage extends StatefulHookConsumerWidget {
  final ChannelStreamPageArgs args;
  const ChannelStreamPage(this.args, {super.key});

  @override
  ConsumerState<ChannelStreamPage> createState() => _ChannelViewPageState();
}

class _ChannelViewPageState extends ConsumerState<ChannelStreamPage> {
  late final Player player;
  late final VideoController? controller;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() {
    player = Player();

    final stream = ref.read(channelStreamStateProvider(widget.args.id));
    if (stream == null) {
      controller = null;
      return;
    }

    controller = VideoController(player);
    player.open(Media(stream));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller == null
                ? Container(
                    constraints: BoxConstraints(
                      maxWidth: 800 - 30,
                      maxHeight: responsiveSize(
                        context,
                        largeSize: percentHeight(context, 60),
                        smallSize: percentHeight(context, 30),
                      ),
                    ),
                    height: percentHeight(context, 30),
                    width: percentWidth(context),
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'This video is unavailable.\nSorry about that.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 800 - 30,
                      maxHeight: responsiveSize(
                        context,
                        largeSize: percentHeight(context, 60),
                        smallSize: percentHeight(context, 30),
                      ),
                    ),
                    child: Video(controller: controller!, fit: BoxFit.fitWidth),
                  ),
            const Expanded(child: ChannelsListView()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

bool isLarge(BuildContext context) => percentWidth(context) >= largeScreenSize;
bool isMedium(BuildContext context) =>
    percentWidth(context) > mediumScreenSize && percentWidth(context) < largeScreenSize;
bool isSmall(BuildContext context) => percentWidth(context) < smallScreenSize;

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 378;

double responsiveSize(
  BuildContext context, {
  required double largeSize,
  double? mediumSize,
  double? smallSize,
}) =>
    isLarge(context)
        ? largeSize
        : isMedium(context)
            ? (mediumSize ?? largeSize)
            : smallSize ?? largeSize;
