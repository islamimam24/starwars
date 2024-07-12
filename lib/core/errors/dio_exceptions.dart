import 'package:dio/dio.dart';

class DioExceptions {
  static List<String> dioExceptionMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.badResponse:
        return [
          "Bad Response",
          err.response?.data["status"] == 422 ? err.response?.data["errors"][0] : "Something Wrong with the server"
        ];
      case DioExceptionType.connectionError:
        return ["Connection Error", "Seems like you have a problem with the Network"];
      case DioExceptionType.connectionTimeout:
        return ["Connection Timeout", "took too long to request data!"];
      case DioExceptionType.cancel:
        return ["Request Cancelled", "Check API url or parameters are invalid"];
      case DioExceptionType.receiveTimeout:
        return ["Bad Response Error", "Something Wrong with the server"];

      default:
        return ["Something's wrong", "Something's wrong"];
    }
  }
}
