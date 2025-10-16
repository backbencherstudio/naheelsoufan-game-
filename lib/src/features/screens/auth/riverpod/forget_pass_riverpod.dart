import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/riverpod/forget_pass_state.dart';

import '../../../../core/constant/api_end_points.dart';

class ForgetPasswordNotifier extends StateNotifier<ForgetPassState> {
  ForgetPasswordNotifier(this._tokenStorage)
      : super(const ForgetPassState());

  final TokenService _tokenStorage;

  Future<void> forgetPassword({
    required String email,
  }) async {
    state = state.copyWith(isLoading: true, message: null);

    try {
      final token = await _tokenStorage.getToken();
      final url = Uri.parse(ApiEndPoints.changePassword);

      debugPrint('===== Body : { email: $email } =====');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'email': email,
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
StateNotifierProvider<ForgetPasswordNotifier, ForgetPassState>((ref) {
  return ForgetPasswordNotifier(TokenService());
});
