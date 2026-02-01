import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    late final String message;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timed out. Please try again.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Request sent timeout. Check your internet connection.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "The server is taking too long to respond.";
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 401) {
          message = "Unauthorized. Please check your API keys.";
        } else if (statusCode == 404) {
          message = "Resource not found.";
        } else {
          message = "Server error ($statusCode). Please try again later.";
        }
        break;
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection. Please check your network.";
        break;
      default:
        message = "An unexpected error occurred. Please try again.";
        break;
    }
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: message,
        type: err.type,
      ),
    );
  }
}
