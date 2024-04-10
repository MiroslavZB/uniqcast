import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/user_channels/channel.dart';
import 'package:uniqcast/modules/user_channels/channels_service.dart';

part 'channel_image_state.g.dart';

@Riverpod(keepAlive: true)
class ChannelImageState extends _$ChannelImageState {
  @override
  Future<File?> build(Channel channel) async {
    if (channel.logoId == null) return null;
    return ChannelsService(ref.watch(clientProvider)).channelImage(
      logoId: channel.logoId!,
      channelId: channel.id,
      accessKey: 'WkVjNWNscFhORDBLCg==',
    );
  }
}
