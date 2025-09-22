import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRated = StateProvider<int> ((ref){
  return 0;
});


class SettingUserModel{
  final String userId;
  final String userName;

  SettingUserModel({
    required this.userId,
    required this.userName
});
  SettingUserModel copyWith({
    String? userId,
    String? userName
}){
   return SettingUserModel(userId: userId??this.userId, userName: userName??this.userName);
  }
}