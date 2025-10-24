import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:naheelsoufan_game/src/core/services/token_services.dart';
import '../../../core/constant/api_end_points.dart';
import '../../../core/services/api_services.dart';

class UserProfileRepository {
  static final TokenService _tokenStorage = TokenService();
  static final apiService = ApiServices();

  static Future<String?> updateProfileName({required String name}) async {
    try {
      final url = Uri.parse(ApiEndPoints.updateProfile);
      final accessToken = await _tokenStorage.getToken();

      if (accessToken == null || accessToken.isEmpty) {
        debugPrint('Access token not found.');
        return null;
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
        return onlyMessage;
      } else {
        debugPrint('Failed: ${response.statusCode}');
        debugPrint('Response: $responseBody');
        return null;
      }
    } catch (e) {
      debugPrint('Error updating profile: $e');
      return null;
    }
  }

  static Future<String?> updateProfilePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final token = await _tokenStorage.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('Access token not found.');
        return null;
      }

      final header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'email': email,
        'old_password': oldPassword,
        'new_password': newPassword,
      };

      debugPrint(
        '===== Body : { email: $email, oldPassword: $oldPassword, newPassword: $newPassword } =====',
      );

      final response = await apiService.postData(
        endPoint: ApiEndPoints.changePassword,
        headers: header,
        body: body,
      );

      if (response["success"] == true) {
        debugPrint('Password updated successfully');
        debugPrint(response['message']);
        return response['message'];
      } else {
        debugPrint('Failed: ${response["message"]}');
        return null;
      }
    } catch (e) {
      debugPrint('Error changing password: $e');
      return null;
    }
  }

  static Future<String?> updateProfilePic({required String imgPath}) async {
    try {
      final url = Uri.parse(ApiEndPoints.updateProfile);
      final accessToken = await _tokenStorage.getToken();

      if (accessToken == null || accessToken.isEmpty) {
        debugPrint('Access token not found.');
        return null;
      }

      final byteData = await rootBundle.load(imgPath);
      final bytes = byteData.buffer.asUint8List();

      final request = http.MultipartRequest('PATCH', url);
      request.headers['Authorization'] = 'Bearer $accessToken';

      final multiPartFile = http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: 'profile_pic.png',
        contentType: MediaType('image', 'png'),
      );

      request.files.add(multiPartFile);

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      debugPrint('\n\n\nResponse: $responseBody\n\n\n');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint('Profile updated successfully');
        final jsonData = jsonDecode(responseBody);
        final String onlyMessage = jsonData['message'];
        return onlyMessage;
      } else {
        debugPrint('Failed: ${response.statusCode}');
        final jsonData = jsonDecode(responseBody);
        final String onlyMessage = jsonData['message'];
        return onlyMessage;
      }
    } catch (e) {
      debugPrint('Error updating profile: $e');
      return null;
    }
  }
}
