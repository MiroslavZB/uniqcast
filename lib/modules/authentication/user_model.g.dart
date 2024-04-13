// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      token: json['access_token'] as String,
      userId: json['user_id'] as int,
      operatorUid: json['operator_uid'] as String,
      expiryTime: json['expires_in'] as String?,
      name: json['operator_name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'access_token': instance.token,
      'user_id': instance.userId,
      'operator_uid': instance.operatorUid,
      'expires_in': instance.expiryTime,
      'operator_name': instance.name,
    };
