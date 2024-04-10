// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPackage _$UserPackageFromJson(Map<String, dynamic> json) => UserPackage(
      id: json['id'] as int,
      datePurchased:
          const OptionalJsonDateTimeUTC().fromJson(json['purchased']),
    );

Map<String, dynamic> _$UserPackageToJson(UserPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchased':
          const OptionalJsonDateTimeUTC().toJson(instance.datePurchased),
    };
