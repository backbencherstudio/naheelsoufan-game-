class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? address;
  final String? phoneNumber;
  final String type;
  final String? gender;
  final String? dateOfBirth;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.address,
    this.phoneNumber,
    required this.type,
    this.gender,
    this.dateOfBirth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      type: json['type'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
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
    };
  }
}
