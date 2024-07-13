// ignore_for_file: public_member_api_docs, sort_constructors_first
class BaseResponse<T> {
  final String? res;
  final String? message;
  final T? data;
  BaseResponse({
    this.res,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'res': res,
      'message': message,
      'data': data,
    };
  }

  factory BaseResponse.fromMap(
      Map<String, dynamic> map, Function(dynamic create) createContent) {
    return BaseResponse<T>(
      res: map['res'] != null ? map['res'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? createContent(map['data']) : null,
    );
  }
}
