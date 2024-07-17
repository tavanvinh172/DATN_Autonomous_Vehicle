import 'dart:convert';

import 'package:automotive_project/core/base/base_remote_source.dart';
import 'package:automotive_project/data/model/api_paging_response.dart';
import 'package:automotive_project/data/remote/auth/auth_remote_data_source.dart';
import 'package:automotive_project/network/dio_provider.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImpl extends BaseRemoteSource
    implements AuthRemoteDataSource {
  final String baseUrl = '${DioProvider.baseUrl}/api/persons/';

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    // var endpoint = "${DioProvider.baseUrl}/api/persons/login";
    // var dioCall = dioClient
    //     .post(endpoint, data: {"username": username, "password": password});
    var url = Uri.https('distributed.webi.vn', 'api/user/login');
    var response = await http.post(
      url,
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );
    try {
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> signup(
      {required String fullName,
      required String phone,
      required String email,
      required int type,
      required String username,
      required String password}) async {
    var url = Uri.https('distributed.webi.vn', 'api/user/register');
    var response = await http.post(
      url,
      body: jsonEncode({
        "username": username,
        "password": password,
        "fullname": fullName,
        "phone": phone,
        "email": email,
        "type": type,
      }),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );
    try {
      return jsonDecode(response.body);
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
