import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/modules/user_channels/channel.dart';
import 'package:uniqcast/modules/user_channels/channel_image_state.dart';
import 'package:uniqcast/modules/user_channels/channels_list_state.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

class Root extends HookConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(channelsListStateProvider);
    // const String a = 'aHR0cHM6Ly9kZW1vLnVuaWZpZWQtc3RyZWFtaW5nLmNvbS9rOHMvZmVhdHVyZXMvc3RhYmxlL3ZpZGVvL3RlYXJzLW'
    // '9mLXN0ZWVsL3RlYXJzLW9mLXN0ZWVsLmlzbS8ubTN1OA==';
    // String decodedString = utf8.decode(base64.decode(a));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            StorageProvider.setToken(null);
            ref.invalidate(routerProvider);
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: state.when(
        data: (data) {
          if (data.isEmpty) return const Center(child: Text('No channels!'));
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (_, i) => ChannelCard(data[i]),
          );
        },
        error: (e, s) {
          log('packagesStateProvider error $e $s');
          return const Text('Something went wrong!');
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class ChannelCard extends HookConsumerWidget {
  final Channel channel;
  const ChannelCard(this.channel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelImageState = ref.watch(channelImageStateProvider(channel));

    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.black,
          child: channelImageState.when(
            data: (data) {
              if (data == null) return const SizedBox.shrink();
              return Image.file(data, fit: BoxFit.cover);
            },
            error: (e, s) {
              log('channelImageState error at ${channel.id}');
              return const SizedBox.shrink();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
        Text(channel.name),
      ],
    );
  }
}
