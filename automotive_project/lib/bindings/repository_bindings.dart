import 'package:automotive_project/data/repository/auth/auth_repository.dart';
import 'package:automotive_project/data/repository/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      tag: (AuthRepository).toString(),
    );
  }
}
