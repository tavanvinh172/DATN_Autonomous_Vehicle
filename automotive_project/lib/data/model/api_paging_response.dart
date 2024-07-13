import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiPagingResponse {
  final Map<String, dynamic>? data;
  final int? count;
  final bool? hasNext;

  ApiPagingResponse({
    this.data,
    this.count,
    this.hasNext,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'count': count,
      'hasNext': hasNext,
    };
  }

  factory ApiPagingResponse.fromMap(Map<String, dynamic> map) {
    return ApiPagingResponse(
      data: map['data'] != null
          ? Map<String, dynamic>.from((map['data'] as Map<String, dynamic>))
          : null,
      count: map['count'] != null ? map['count'] as int : null,
      hasNext: map['hasNext'] != null ? map['hasNext'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiPagingResponse.fromJson(String source) =>
      ApiPagingResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
