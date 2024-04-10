import 'package:json_annotation/json_annotation.dart';

class JsonDateTimeUTC implements JsonConverter<DateTime, dynamic> {
  const JsonDateTimeUTC();

  @override
  DateTime fromJson(dynamic object) {
    if (object is String) {
      if (object.endsWith('Z')) return DateTime.parse(object).toLocal();
      return DateTime.parse('${object}Z').toLocal();
    }
    throw ('JsonDateTimeUTC converter received $object');
  }

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}

class OptionalJsonDateTimeUTC implements JsonConverter<DateTime?, dynamic> {
  const OptionalJsonDateTimeUTC();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is String) {
      if (json.endsWith('Z')) return DateTime.parse(json).toLocal();
      return DateTime.parse('${json}Z').toLocal();
    }
    throw ('OptionalJsonDateTimeUTC converter received $json');
  }

  @override
  String? toJson(DateTime? object) => object?.toUtc().toIso8601String();
}

