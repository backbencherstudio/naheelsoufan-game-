class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String? address;
  final String? phoneNumber;
  final String type;
  final String? gender;
  final String? dateOfBirth;
  final String? createdAt;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    this.address,
    this.phoneNumber,
    required this.type,
    this.gender,
    this.dateOfBirth,
    required this.createdAt,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      type: json['type'] as String,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      createdAt: json['created_at'] as String?,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'address': address,
      'phone_number': phoneNumber,
      'type': type,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'created_at': createdAt,
      'avatar_url': avatarUrl,
    };
  }
}
