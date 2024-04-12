import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Logo {
  @JsonKey(name: 'CARD')
  final int? card;
  @JsonKey(name: 'NORMAL')
  final int? normal;

  Logo({this.card, this.normal});

  Map<String, dynamic> toJson() => _$LogoToJson(this);

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);
}

@JsonSerializable()
class Channel {
  final int id;
  final String uid;
  final int position;
  final String type;
  final String resolution;
  final String name;
  @JsonKey(name: 'short_name')
  final String shortName;
  @JsonKey(name: 'logos')
  final Logo? logo;

  Channel({
    required this.id,
    required this.uid,
    required this.position,
    required this.type,
    required this.resolution,
    required this.name,
    required this.shortName,
    this.logo,
  });

  // Getters
  int? get logoId => logo?.card ?? logo?.normal;

  Map<String, dynamic> toJson() => _$ChannelToJson(this);

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Channel && other.hashCode == hashCode;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(id, uid, position, type, resolution, name, shortName, logoId);
}
