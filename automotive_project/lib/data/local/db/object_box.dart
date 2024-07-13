import 'package:automotive_project/data/model/devices/device.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../objectbox.g.dart';

class ObjectBox extends GetxController {
  /// The Store of this app.
  late final Store _store;

  /// A Box of notes.
  late final Box<Device> _deviceBox;

  final devices = [].obs;

  ObjectBox._create(this._store) {
    _deviceBox = Box<Device>(_store);

    // Add some demo data if the box is empty.
    if (_deviceBox.isEmpty()) {
      _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Note: setting a unique directory is recommended if running on desktop
    // platforms. If none is specified, the default directory is created in the
    // users documents directory, which will not be unique between apps.
    // On mobile this is typically fine, as each app has its own directory
    // structure.

    // Note: set macosApplicationGroup for sandboxed macOS applications, see the
    // info boxes at https://docs.objectbox.io/getting-started for details.

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
        directory:
            p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  void _putDemoData() {
    final demoDevices = [
      Device("Car", "192.168.1.1", "3000"),
    ];
    _deviceBox.putMany(demoDevices);
  }

  getAllDevices() {
    final builder =
        _deviceBox.query().order(Device_.date, flags: Order.descending);
    builder.watch(triggerImmediately: true).listen((query) {
      final list = query.find();
      devices.value = list;
    });
    return devices;
  }

  Stream<List<Device>> getDevices() {
    // Query for all notes, sorted by their date.
    // https://docs.objectbox.io/queries
    final builder =
        _deviceBox.query().order(Device_.date, flags: Order.descending);
    // Build and watch the query,
    // set triggerImmediately to emit the query immediately on listen.
    return builder
        .watch(triggerImmediately: true)
        // Map it to a list of notes to be used by a StreamBuilder.
        .map((query) => query.find());
  }

  Device getDeviceById(int id) =>
      _deviceBox.query(Device_.id.equals(id)).build().findFirst() ??
      Device('', '', '');

  Device getDeviceByIP(String ipAddress) =>
      _deviceBox
          .query(Device_.ipAddress.equals(ipAddress))
          .build()
          .findFirst() ??
      Device('', '', '');

  /// Add a note.
  ///
  /// To avoid frame drops, run ObjectBox operations that take longer than a
  /// few milliseconds, e.g. putting many objects, asynchronously.
  /// For this example only a single object is put which would also be fine if
  /// done using [Box.put].
  Future<void> addDevice(String deviceName, String ipAddress, String port) =>
      _deviceBox.putAsync(Device(deviceName, ipAddress, port));

  Future<void> removeDevice(int id) async => _deviceBox.remove(id);

  void editDevice(int id, String deviceName, String ipAddress, String port) {
    final data = getDeviceById(id);
    data.deviceName = deviceName;
    data.ipAddress = ipAddress;
    data.port = port;
    _deviceBox.put(data, mode: PutMode.update);
  }
}
