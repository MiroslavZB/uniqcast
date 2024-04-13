import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/modules/channels/channel_card.dart';
import 'package:uniqcast/modules/channels/state/channels_list_state.dart';

class ChannelsListView extends HookConsumerWidget {
  const ChannelsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(channelsListStateProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: state.when(
          data: (data) {
            const Center(child: CircularProgressIndicator());
            if (data.isEmpty) return const Center(child: Text('No channels!'));
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (_, i) => ChannelCard(channel: data[i]),
            );
          },
          error: (e, s) {
            log('packagesStateProvider error $e $s');
            return const Text('Something went wrong!');
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
