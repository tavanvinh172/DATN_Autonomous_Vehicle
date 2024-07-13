import 'package:automotive_project/bindings/local_source_bindings.dart';
import 'package:automotive_project/bindings/network_connection_binding.dart';
import 'package:automotive_project/bindings/remote_source_bindings.dart';
import 'package:automotive_project/bindings/repository_bindings.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
    RemoteSourceBindings().dependencies();
    RepositoryBindings().dependencies();
    NetworkConnectionBindings().dependencies();
  }
}
