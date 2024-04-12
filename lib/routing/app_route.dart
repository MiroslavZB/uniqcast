enum AppRoute {
  root('/'),
  login('/login'),
  channelStream('/channel-stream');

  final String path;
  final String name;

  const AppRoute(this.path, [String? name]) : name = name ?? path;
}
