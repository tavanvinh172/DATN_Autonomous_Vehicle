import 'package:automotive_project/network/exceptions/app_exception.dart';

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = -1, this.status = "", super.message});
}
