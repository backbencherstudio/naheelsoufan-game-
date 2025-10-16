import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';

import '../../../../core/constant/api_end_points.dart';
import 'change_password_state.dart';

class ChangePasswordNotifier extends StateNotifier<ChangePasswordState> {
  ChangePasswordNotifier(this._tokenStorage)
      : super(const ChangePasswordState());

  final TokenService _tokenStorage;

  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true, message: null);

    try {
      final token = await _tokenStorage.getToken();
      final url = Uri.parse(ApiEndPoints.changePassword);

      debugPrint('===== Body : { email: $email, oldPassword: $oldPassword, newPassword: $newPassword } =====');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'email': email,
          'old_password': oldPassword,
          'new_password': newPassword,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: responseData['message'] ?? 'Password updated successfully',
        );
      } else {
        debugPrint('Failed: ${response.statusCode} - ${response.body}');
        final responseData = jsonDecode(response.body);
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: responseData['message'] ?? 'Failed to update password',
        );
      }
    } catch (e) {
      debugPrint('Error changing password: $e');
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        message: 'An error occurred',
      );
    }
  }
}

final changePasswordProvider =
StateNotifierProvider<ChangePasswordNotifier, ChangePasswordState>((ref) {
  return ChangePasswordNotifier(TokenService());
});
