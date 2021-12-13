import 'package:dio/dio.dart';

mixin WebAPIMixin {
  void onDioError(DioError error, String apiName) {
    String msg;
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.other:
        msg = "Please check your network connectivity";

        break;
      case DioErrorType.response:
        msg = '';

        break;
      case DioErrorType.cancel:
        msg = 'The request has been cancelled';
        break;
    }
  }
}
