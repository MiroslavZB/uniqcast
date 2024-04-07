String? nonEmptyField(String? value, String fieldName) {
  if (value == null) return null;
  if (value.isEmpty) return '$fieldName can\'t be empty!';
  return null;
}
