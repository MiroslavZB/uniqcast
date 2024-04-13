import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/functions/schedule_after_build.dart';
import 'package:uniqcast/modules/channels/channel_stream_page.dart';
import 'package:uniqcast/modules/channels/models/channel.dart';
import 'package:uniqcast/modules/channels/state/channel_image_state.dart';
import 'package:uniqcast/modules/channels/state/channel_stream_state.dart';
import 'package:uniqcast/resources/border_radius.dart';
import 'package:uniqcast/routing/app_route.dart';

class ChannelCard extends HookConsumerWidget {
  final Channel channel;

  const ChannelCard({super.key, required this.channel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelImageState = ref.watch(channelImageStateProvider(channel));
    useEffect(() {
      const String encodedStream =
          'aHR0cHM6Ly9kZW1vLnVuaWZpZWQtc3RyZWFtaW5nLmNvbS9rOHMvZmVhdHVyZXMvc3RhYmxlL3ZpZGVvL3RlYXJzLW'
          '9mLXN0ZWVsL3RlYXJzLW9mLXN0ZWVsLmlzbS8ubTN1OA==';

      final stream = utf8.decode(base64.decode(encodedStream));

      scheduleAfterBuild(() => ref.watch(channelStreamStateProvider(channel.id).notifier).set(stream));
      return null;
    }, const []);

    final t = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        if (context.canPop()) {
          context.pushReplacement(
            AppRoute.channelStream.path,
            extra: ChannelStreamPageArgs(channel.id),
          );
        } else {
          context.push(
            AppRoute.channelStream.path,
            extra: ChannelStreamPageArgs(channel.id),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.only(right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: t.secondaryContainer,
          borderRadius: smallBorderRadius,
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: smallBorderRadius,
              ),
              child: channelImageState.when(
                data: (data) {
                  if (data == null) return const SizedBox.shrink();
                  return data;
                },
                error: (e, s) {
                  log('channelImageState error at ${channel.id}');
                  return const SizedBox.shrink();
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
            Expanded(
              child: Text(
                channel.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: t.onSecondaryContainer),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 40,
              color: t.primary,
            ),
          ],
        ),
      ),
    );
  }
}
