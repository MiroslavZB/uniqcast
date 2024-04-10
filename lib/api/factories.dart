import 'package:uniqcast/modules/authentication/login_response.dart';
import 'package:uniqcast/modules/user_channels/channel.dart';
import 'package:uniqcast/modules/user_packages/user_package.dart';

typedef JsonFactory<T> = T Function(dynamic data);

// Factories for conversion
final Map<Type, JsonFactory> factories = {
  LoginResponse: (data) => LoginResponse.fromJson(data as Map<String, dynamic>),
  List<UserPackage>: (data) => (data as List<dynamic>).map((e) => UserPackage.fromJson(e)).toList(),
  List<Channel>: (data) => (data as List<dynamic>).map((e) => Channel.fromJson(e)).toList(),
};
