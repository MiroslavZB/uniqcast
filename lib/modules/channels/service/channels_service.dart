import 'dart:io';
import 'dart:typed_data';

import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/channels/models/channel.dart';

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

  Future<File?> channelImage({required int logoId, required int channelId}) => client.downloadFile(
        endPoint: '/v1/global/images/$logoId', //'/v1/global/images/$channelId',
        savePath: 'image$channelId.png',
        queryParams: {'accessKey': 'WkVjNWNscFhORDBLCg=='},
      );

  Future<Uint8List?> channelImageForWeb({required int logoId, required int channelId}) =>
      client.downloadFileForWeb(
        endPoint: '/v1/global/images/$logoId', //'/v1/global/images/$channelId',
        savePath: 'image$channelId.png',
        queryParams: {'accessKey': 'WkVjNWNscFhORDBLCg=='},
      );
}
