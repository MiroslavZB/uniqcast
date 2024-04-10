// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      card: json['CARD'] as int?,
      normal: json['NORMAL'] as int?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'CARD': instance.card,
      'NORMAL': instance.normal,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as int,
      uid: json['uid'] as String,
      position: json['position'] as int,
      type: json['type'] as String,
      resolution: json['resolution'] as String,
      name: json['name'] as String,
      shortName: json['short_name'] as String,
      logo: json['logos'] == null
          ? null
          : Logo.fromJson(json['logos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'position': instance.position,
      'type': instance.type,
      'resolution': instance.resolution,
      'name': instance.name,
      'short_name': instance.shortName,
      'logos': instance.logo,
    };
