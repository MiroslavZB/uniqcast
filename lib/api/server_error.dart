class ServerError {
  final String message;
  final int statusCode;
  final String status;

  ServerError({required this.message, required this.statusCode, required this.status});

  factory ServerError.fromJson(Map<String, dynamic> json) => ServerError(
        message: json['data']?['message'] ?? 'Something went wrong',
        statusCode: json['code'] ?? 400,
        status: json['status'] ?? 'error',
      );
}
