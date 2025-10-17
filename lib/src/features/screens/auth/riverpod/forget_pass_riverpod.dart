import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:naheelsoufan_game/src/features/screens/auth/riverpod/forget_pass_state.dart';

import '../../../../core/constant/api_end_points.dart';

class ForgetPasswordNotifier extends StateNotifier<ForgetPassState> {
  ForgetPasswordNotifier()
      : super(const ForgetPassState());

  Future<bool> forgetPassword({required String email}) async {
    state = state.copyWith(isLoading: true, message: null);

    try {
      final url = Uri.parse(ApiEndPoints.forgetPassword);
      debugPrint('===== Body : { email: $email } =====');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('===== Response : $responseData =====');
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: responseData['message'] ?? 'A code has been sent to the email',
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

final forgetPasswordProvider =
StateNotifierProvider<ForgetPasswordNotifier, ForgetPassState>((ref) {
  return ForgetPasswordNotifier();
});
