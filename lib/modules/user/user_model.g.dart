// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int,
      operatorUid: json['operatorUid'] as String,
      tokenExpiryDate:
          const JsonDateTimeUTC().fromJson(json['tokenExpiryDate']),
      name: json['name'] as String?,
      deviceId: json['deviceId'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'operatorUid': instance.operatorUid,
      'tokenExpiryDate': _$JsonConverterToJson<dynamic, DateTime>(
          instance.tokenExpiryDate, const JsonDateTimeUTC().toJson),
      'name': instance.name,
      'deviceId': instance.deviceId,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
