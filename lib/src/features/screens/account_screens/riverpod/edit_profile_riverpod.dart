import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:naheelsoufan_game/src/core/constant/api_end_points.dart';

import '../../../../core/services/token_services.dart';
import 'edit_profile_state.dart';

class EditProfileNotifier extends StateNotifier<EditProfileState> {
  EditProfileNotifier(this._tokenStorage) : super(const EditProfileState());

  final TokenService _tokenStorage;

  /// update profile
  Future<bool> updateProfile({
    required String name,
  }) async {
    state = state.copyWith(isLoading: true);

    final url = Uri.parse(ApiEndPoints.updateProfile);
    try {
      final accessToken = await _tokenStorage.getToken();
      if (accessToken == null) {
        debugPrint('Access token not found.');
        state = state.copyWith(isLoading: false);
        return false;
      }

      final request = http.MultipartRequest('PATCH', url);
      request.headers['Authorization'] = 'Bearer $accessToken';

      request.fields['name'] = name;

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint('Profile updated successfully');
        final jsonData = jsonDecode(responseBody);
        final String onlyMessage = jsonData['message'];

        state = state.copyWith(
          isLoading: false,
          message: onlyMessage,
        );
        return true;
      } else {
        debugPrint('Failed: ${response.statusCode}');
        debugPrint('Response: $responseBody');
        state = state.copyWith(isLoading: false);
        return false;
      }
    } catch (e) {
      debugPrint('Error updating profile: $e');
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}


final editProfileProvider = StateNotifierProvider<EditProfileNotifier, EditProfileState>((ref) {
  return EditProfileNotifier(TokenService());
});

