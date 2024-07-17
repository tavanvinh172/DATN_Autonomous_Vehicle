import 'package:automotive_project/data/model/api_paging_response.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<Map<String, dynamic>> signup(
      {required String fullName,
      required String phone,
      required String email,
      required int type,
      required String username,
      required String password});
  Future<ApiPagingResponse> paging(int pageIndex, int pageSize, String keyword);
}
