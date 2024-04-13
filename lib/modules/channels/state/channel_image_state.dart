import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/channels/models/channel.dart';
import 'package:uniqcast/modules/channels/service/channels_service.dart';

part 'channel_image_state.g.dart';

@Riverpod(keepAlive: true)
class ChannelImageState extends _$ChannelImageState {
  @override
  Future<Image?> build(Channel channel) async {
    //if (channel.logoId == null) return null;
    if (kIsWeb) {
      final bytes = await ChannelsService(ref.watch(clientProvider)).channelImageForWeb(
        logoId: channel.id, // channel.logoId
        channelId: channel.id,
      );
      if (bytes == null) return null;
      return Image.memory(bytes, fit: BoxFit.cover);
    }
    final file = await ChannelsService(ref.watch(clientProvider)).channelImage(
      logoId: channel.id, // channel.logoId
      channelId: channel.id,
    );

    if (file == null) return null;
    return Image.file(file, fit: BoxFit.cover);
  }
}
