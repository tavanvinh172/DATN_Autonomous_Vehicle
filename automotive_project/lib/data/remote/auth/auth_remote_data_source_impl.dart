import 'dart:convert';

import 'package:automotive_project/core/base/base_remote_source.dart';
import 'package:automotive_project/data/model/api_paging_response.dart';
import 'package:automotive_project/data/remote/auth/auth_remote_data_source.dart';
import 'package:automotive_project/network/dio_provider.dart';

class AuthRemoteDataSourceImpl extends BaseRemoteSource
    implements AuthRemoteDataSource {
  final String baseUrl = '${DioProvider.baseUrl}/api/persons/';

  @override
  Future<Map<String, dynamic>> login(String username, String password) {
    // var endpoint = "${DioProvider.baseUrl}/api/persons/login";
    // var dioCall = dioClient
    //     .post(endpoint, data: {"username": username, "password": password});
    var endpoint = "https://distributed.webi.vn/api/user/login";
    var dioCall = dioClient.post(endpoint, data: {
      "username": username,
      "password": password,
    });
    try {
      return callApiWithErrorParser(dioCall).then((response) {
        return jsonDecode(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiPagingResponse> paging(
      int pageIndex, int pageSize, String keyword) {
    var endpoint = DioProvider.baseUrl;
    var dioCall = dioClient.post(endpoint, queryParameters: {
      "pageIndex": pageIndex,
      "pageSize": pageSize,
      "keyword": keyword
    });
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => ApiPagingResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
