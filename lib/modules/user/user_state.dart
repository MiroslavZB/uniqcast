import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/modules/user/user_model.dart';

part 'user_state.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  UserModel build() => throw Exception('User hasn\'t been initialized');

  void set(UserModel userModel) => state = userModel;
}
