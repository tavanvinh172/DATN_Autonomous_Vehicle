import 'package:automotive_project/data/model/api_paging_response.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<ApiPagingResponse> paging(int pageIndex, int pageSize, String keyword);
}
