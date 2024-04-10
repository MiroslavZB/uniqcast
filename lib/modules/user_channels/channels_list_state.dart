import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/user/user_state.dart';
import 'package:uniqcast/modules/user_channels/channel.dart';
import 'package:uniqcast/modules/user_channels/channels_service.dart';
import 'package:uniqcast/modules/user_packages/packages_state.dart';
import 'package:uniqcast/utils/extensions.dart';

part 'channels_list_state.g.dart';

@Riverpod(keepAlive: true)
class ChannelsListState extends _$ChannelsListState {
  late ChannelsService channelsService;
  @override
  Future<List<Channel>> build() async {
    channelsService = ChannelsService(ref.watch(clientProvider));
    final user = ref.watch(userStateProvider);

    if (user == null) return [];

    final packages = ref.watch(packagesStateProvider);
    if (packages.isLoading || packages.hasError || !packages.valueOrNull.safeNotEmpty) return [];

    return channelsService.getChannels(
      operatorUid: user.operatorUid,
      userId: user.userId,
      packageIds: packages.value!.map((e) => e.id).toList(),
    );
  }
}
