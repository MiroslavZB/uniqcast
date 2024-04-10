import 'dart:io';

import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/user_channels/channel.dart';

class ChannelsService {
  final Client client;

  ChannelsService(this.client);

  Future<List<Channel>> getChannels({
    required String operatorUid,
    required int userId,
    required List<int> packageIds,
  }) =>
      client.get<List<Channel>>(
        '/v2/$operatorUid/channels',
        queryParams: {'packages': packageIds},
      );

  // Future<String> channelImage({
  //   required int channelId,
  //   required String accessKey,
  // }) =>
  //     client.get<String>(
  //       '/v1/global/images/$channelId',
  //       queryParams: {'accessKey': accessKey},
  //     );

  Future<File?> channelImage({
    required int logoId,
    required int channelId,
    required String accessKey,
  }) =>
      client.downloadFile(
        endPoint: '/v1/global/images/$logoId',
        savePath: 'image$channelId.png',
        queryParams: {'accessKey': accessKey},
      );
}
//https://office-new-dev.uniqcast.com:12802/api/client/v1/global/images/5628?accessKey=WkVjNWNscFhORDBLCg==
