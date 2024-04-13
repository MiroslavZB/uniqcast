import 'package:uniqcast/modules/authentication/user_model.dart';
import 'package:uniqcast/modules/channels/models/channel.dart';
import 'package:uniqcast/modules/user_packages/user_package.dart';

typedef JsonFactory<T> = T Function(dynamic data);

// Factories for conversion
final Map<Type, JsonFactory> factories = {
  UserModel: (data) => UserModel.fromJson(data as Map<String, dynamic>),
  List<UserPackage>: (data) => (data as List<dynamic>).map((e) => UserPackage.fromJson(e)).toList(),
  List<Channel>: (data) => (data as List<dynamic>).map((e) => Channel.fromJson(e)).toList(),
};
