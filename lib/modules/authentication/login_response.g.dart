// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['access_token'] as String,
      name: json['operator_name'] as String?,
      userId: json['user_id'] as int,
      operatorUid: json['operator_uid'] as String,
      deviceId: json['device_id'] as int,
      isBlocked: json['is_blocked'] as bool,
      expiryTime: json['expires_in'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'user_id': instance.userId,
      'operator_uid': instance.operatorUid,
      'operator_name': instance.name,
      'is_blocked': instance.isBlocked,
      'device_id': instance.deviceId,
      'expires_in': instance.expiryTime,
    };
