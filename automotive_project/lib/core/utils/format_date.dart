import 'package:intl/intl.dart';

String advancedformatDateString(String? dateTimeString, String format) {
  if (dateTimeString != null && dateTimeString.isNotEmpty) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat(format).format(dateTime);
  }
  return "";
}
