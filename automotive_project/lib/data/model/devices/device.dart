// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Device {
  int id;
  String? deviceName;
  String ipAddress;
  String? port;
  DateTime date;
  Device(this.deviceName, this.ipAddress, this.port,
      {this.id = 0, DateTime? date})
      : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}
