import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/user/user_state.dart';
import 'package:uniqcast/modules/user_packages/packages_service.dart';
import 'package:uniqcast/modules/user_packages/user_package.dart';

part 'packages_state.g.dart';

@Riverpod(keepAlive: true)
class PackagesState extends _$PackagesState {
  late PackagesService packagesService;
  @override
  Future<List<UserPackage>> build() async {
    packagesService = PackagesService(ref.watch(clientProvider));
    final user = ref.watch(userStateProvider);
    if (user == null) return [];

    try {
      return packagesService.getPackages(operatorUid: user.operatorUid, userId: user.userId);
    } catch (e, s) {
      log('packages state internal error $e $s');
      return [];
    }
  }
}
