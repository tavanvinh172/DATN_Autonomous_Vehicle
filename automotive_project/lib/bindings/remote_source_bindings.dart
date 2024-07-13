import 'package:automotive_project/data/remote/auth/auth_remote_data_source.dart';
import 'package:automotive_project/data/remote/auth/auth_remote_data_source_impl.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
      tag: (AuthRemoteDataSource).toString(),
    );
  }
}
