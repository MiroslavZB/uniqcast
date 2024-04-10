import 'package:json_annotation/json_annotation.dart';
import 'package:uniqcast/api/json_date_time.dart';

part 'user_package.g.dart';

@JsonSerializable()
class UserPackage {
  final int id;
  @OptionalJsonDateTimeUTC()
  @JsonKey(name: 'purchased')
  final DateTime? datePurchased;

  const UserPackage({required this.id, required this.datePurchased});

  Map<String, dynamic> toJson() => _$UserPackageToJson(this);

  factory UserPackage.fromJson(Map<String, dynamic> json) => _$UserPackageFromJson(json);
}
