import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:naheelsoufan_game/src/features/screens/auth/riverpod/reset_pass_state.dart';

import '../../../../core/constant/api_end_points.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPassState> {
  ResetPasswordNotifier() : super(const ResetPassState());

  String _otpToken = '';
  String get otpToken => _otpToken;

  void setOtpToken(String token) {
    _otpToken = token;
    debugPrint('------ OTP Token set: $_otpToken ------');
  }

  String _email = '';
  String get email => _email;

  void setEmail(String email) {
    _email = email;
    debugPrint('------ Email set: $_email ------');
  }



  Future<bool> resetPassword({
    required String newPass,
  }) async {
    if (_otpToken.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        message: 'OTP token is missing',
      );
      return false;
    }

    state = state.copyWith(isLoading: true, message: null);

    try {
      final url = Uri.parse(ApiEndPoints.resetPassword);
      debugPrint('===== Body : { email: $email, newPass: $newPass, token: $_otpToken } =====');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": _email,
          "token": _otpToken,
          "password": newPass,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: responseData['message'] ?? 'Password updated successfully',
        );
        return true;
      } else {
        debugPrint('Failed: ${response.statusCode} - ${response.body}');
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: responseData['message'] ?? 'Failed to update password',
        );
        return false;
      }
    } catch (e) {
      debugPrint('Error changing password: $e');
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        message: 'An error occurred',
      );
      return false;
    }
  }
}

final resetPasswordProvider =
StateNotifierProvider<ResetPasswordNotifier, ResetPassState>((ref) {
  return ResetPasswordNotifier();
});
