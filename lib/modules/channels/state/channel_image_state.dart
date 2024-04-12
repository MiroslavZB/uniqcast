import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/channels/models/channel.dart';
import 'package:uniqcast/modules/channels/service/channels_service.dart';

part 'channel_image_state.g.dart';

@Riverpod(keepAlive: true)
class ChannelImageState extends _$ChannelImageState {
  @override
  Future<File?> build(Channel channel) async {
    //if (channel.logoId == null) return null;
    return ChannelsService(ref.watch(clientProvider)).channelImage(
      logoId: channel.id,
      channelId: channel.id,
      accessKey: 'WkVjNWNscFhORDBLCg==',
    );
  }
}
