import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_stream_state.g.dart';

@Riverpod(keepAlive: true)
class ChannelStreamState extends _$ChannelStreamState {
  @override
  String? build(int channelId) => null;

  void set(String? stream) => state = stream;
}
