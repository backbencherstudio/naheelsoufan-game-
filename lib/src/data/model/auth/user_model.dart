class UserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? avatar_url;
  String? address;
  String? phoneNumber;
  String? type;
  String? gender;
  String? dateOfBirth;
  String? createdAt;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.avatar,
        this.avatar_url,
        this.address,
        this.phoneNumber,
        this.type,
        this.gender,
        this.dateOfBirth,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatar_url = json['avatar_url'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['avatar_url'] = this.avatar_url;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['created_at'] = this.createdAt;
    return data;
  }
}
