enum AppRoute {
  root('/'),
  login('/login'),
  register('/register'),
  home('/home'),
  channelDetails('/channel-details');

  final String path;
  final String name;

  const AppRoute(this.path, [String? name]) : name = name ?? path;
}
