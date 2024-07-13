import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  int? personId;
  String? username;
  int? role;
  String? name;
  String? phoneNumber;
  DateTime? birthday;
  String? urlImg;
  String? token;
  DateTime? createDate;
  Person({
    this.personId,
    this.username,
    this.role,
    this.name,
    this.phoneNumber,
    this.birthday,
    this.urlImg,
    this.token,
    this.createDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'personId': personId,
      'username': username,
      'role': role,
      'name': name,
      'phoneNumber': phoneNumber,
      'birthday': birthday?.millisecondsSinceEpoch,
      'urlImg': urlImg,
      'token': token,
      'createDate': createDate?.millisecondsSinceEpoch,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      personId: map['personId'] != null ? map['personId'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      role: map['role'] != null ? map['role'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      birthday: map['birthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthday'] as int)
          : null,
      urlImg: map['urlImg'] != null ? map['urlImg'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      createDate: map['createDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createDate'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
