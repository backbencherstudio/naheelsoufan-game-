import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRated = StateProvider<int> ((ref){
  return 0;
});


class UserModel{
  final String userId;
  final String userName;

  UserModel({
    required this.userId,
    required this.userName
});
  UserModel copyWith({
    String? userId,
    String? userName
}){
   return UserModel(userId: userId??this.userId, userName: userName??this.userName);
  }
}