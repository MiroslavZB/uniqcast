import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'operator_name')
  final String? name;
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;

  /// in ms
  @JsonKey(name: 'expires_in')
  final int? expiryTime;

  LoginResponse({
    required this.token,
    required this.name,
    required this.userId,
    required this.isBlocked,
    required this.expiryTime,
  });

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
