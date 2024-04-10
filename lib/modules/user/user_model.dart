import 'package:json_annotation/json_annotation.dart';
import 'package:uniqcast/api/json_date_time.dart';
import 'package:uniqcast/modules/authentication/login_response.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int userId;
  final String operatorUid;
  @JsonDateTimeUTC()
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

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
