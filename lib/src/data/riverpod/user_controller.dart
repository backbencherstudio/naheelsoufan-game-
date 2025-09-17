import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/repository/auth/auth_repository_implementation.dart';
import '../model/auth/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  // Insert new user data
  void insertData() async{
    final user = await AuthRepositoryImplementation().fetchUserData();
    state = user;
  }

  // Update data (call this with patched user)
  void updateData({
    String? name,
    String? email,
    String? avatar,
    String? address,
    String? phoneNumber,
    String? type,
    String? gender,
    String? dateOfBirth,
    String? createdAt,
  }) {
    if (state != null) {
      state = UserModel(
        id: state!.id,
        name: name ?? state!.name,
        email: email ?? state!.email,
        avatar: avatar ?? state!.avatar,
        address: address ?? state!.address,
        phoneNumber: phoneNumber ?? state!.phoneNumber,
        type: type ?? state!.type,
        gender: gender ?? state!.gender,
        dateOfBirth: dateOfBirth ?? state!.dateOfBirth,
        createdAt: createdAt ?? state!.createdAt,
      );
    }
  }

  // Clear data (log out, reset)
  void clearData() => state = null;
}