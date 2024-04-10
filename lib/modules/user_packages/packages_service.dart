import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/user_packages/user_package.dart';

class PackagesService {
  final Client client;

  PackagesService(this.client);

  Future<List<UserPackage>> getPackages({
    required String operatorUid,
    required int userId,
  }) =>
      client.get<List<UserPackage>>(
        '/v1/$operatorUid/users/$userId/packages',
        queryParams: {'device_class': 'Mobile'},
      );
}
