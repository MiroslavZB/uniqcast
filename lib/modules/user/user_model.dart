import 'package:uniqcast/modules/authentication/login_response.dart';

class UserModel {
  final int userId;
  final String operatorUid;
  final DateTime? tokenExpiryDate;
  final String? name;
  final int deviceId;

  UserModel({
    required this.userId,
    required this.operatorUid,
    required this.tokenExpiryDate,
    this.name,
    required this.deviceId,
  });

  factory UserModel.fromLoginResponse(LoginResponse data, DateTime? expiryDate) => UserModel(
        userId: data.userId,
        operatorUid: data.operatorUid,
        tokenExpiryDate: expiryDate,
        name: data.name,
        deviceId: data.deviceId,
      );
}
