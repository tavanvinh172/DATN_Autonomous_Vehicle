import 'package:automotive_project/network/exceptions/base_exception.dart';

class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}
