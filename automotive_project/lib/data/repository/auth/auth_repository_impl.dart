import 'package:automotive_project/data/model/api_paging_response.dart';
import 'package:automotive_project/data/remote/auth/auth_remote_data_source.dart';
import 'package:automotive_project/data/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource =
      Get.find(tag: (AuthRemoteDataSource).toString());

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    return await _remoteDataSource.login(username, password);
  }

  @override
  Future<ApiPagingResponse> paging(
      int pageIndex, int pageSize, String keyword) {
    return _remoteDataSource.paging(pageIndex, pageSize, keyword);
  }

  @override
  Future<Map<String, dynamic>> signup(
      {required String fullName,
      required String phone,
      required String email,
      required int type,
      required String username,
      required String password}) {
    return _remoteDataSource.signup(
        fullName: fullName,
        phone: phone,
        email: email,
        type: type,
        username: username,
        password: password);
  }
}
