import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/modules/authentication/user_model.dart';

part 'user_state.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  UserModel? build() => null;

  void set(UserModel? userModel) => state = userModel;
}
