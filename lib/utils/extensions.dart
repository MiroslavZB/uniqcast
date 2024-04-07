import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uniqcast/api/server_error.dart';

extension Validate on GlobalKey<FormState> {
  bool get valid => currentState?.validate() ?? false;
}

extension NotNullAndEmptyList on List? {
  bool get safeEmpty => this?.isEmpty == true;
}

extension NotNullAndNotEmptyList on List? {
  bool get safeNotEmpty => this?.isNotEmpty == true;
}

extension NotNullAndEmptyString on String? {
  bool get safeEmpty => this?.isEmpty == true;
}

extension NotNullAndNotEmptyString on String? {
  bool get safeNotEmpty => this?.isNotEmpty == true;
}

extension MaterialStatePropertyExtension<T> on T {
  MaterialStateProperty<T> get toMaterialStateProperty => MaterialStateProperty.all<T>(this);
}

extension Flip on ValueNotifier<bool> {
  void flip() => value = !value;
}

extension ShowSnackBar on BuildContext {
  showSnackBar(BuildContext context, [String? message]) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message ?? 'Something went wrong')),
      );
}

extension GetMessage on DioException {
  String? get serverErrorMessage {
    if (error is ServerError) return (error as ServerError).message;

    return null;
  }
}
