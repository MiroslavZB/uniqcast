import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'operator_uid')
  final String operatorUid;

  /// in ms
  @JsonKey(name: 'expires_in')
  final String? expiryTime;
  @JsonKey(name: 'operator_name')
  final String? name;

  UserModel({
    required this.token,
    required this.userId,
    required this.operatorUid,
    required this.expiryTime,
    this.name,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
