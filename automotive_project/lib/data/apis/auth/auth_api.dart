import 'package:automotive_project/data/apis/api_request_representable.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class AuthApi implements APIRequestRepresentable {
  AuthApi.login(String username, String password);

  @override
  // TODO: implement body
  get body => throw UnimplementedError();

  @override
  // TODO: implement endpoint
  String get endpoint => throw UnimplementedError();

  @override
  // TODO: implement form
  FormData get form => throw UnimplementedError();

  @override
  // TODO: implement method
  HTTPMethod get method => throw UnimplementedError();

  @override
  // TODO: implement path
  String get path => throw UnimplementedError();

  @override
  // TODO: implement query
  Map<String, String>? get query => throw UnimplementedError();

  @override
  Future request() {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  // TODO: implement url
  String get url => throw UnimplementedError();
}
