import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'operator_uid')
  final String operatorUid;
  @JsonKey(name: 'operator_name')
  final String? name;
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @JsonKey(name: 'device_id')
  final int deviceId;

  /// in ms
  @JsonKey(name: 'expires_in')
  final String? expiryTime;

  LoginResponse({
    required this.token,
    required this.name,
    required this.userId,
    required this.operatorUid,
    required this.deviceId,
    required this.isBlocked,
    required this.expiryTime,
  });

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
