// ignore_for_file: public_member_api_docs, sort_constructors_first
class DevicesModel {
  final String? image;
  final String? name;
  final bool? isActive;
  DevicesModel({
    this.image,
    this.name,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'isActive': isActive,
    };
  }

  factory DevicesModel.fromMap(Map<String, dynamic> map) {
    return DevicesModel(
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
    );
  }
}
