import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constant/api_end_points.dart';

class ApiServices {
  // Check Internet
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await http.get(Uri.parse('https://www.google.com'));
      return result.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  // Handle Response
  static dynamic _handleResponse(http.Response response) {
    log("Response Status Code: ${response.statusCode}");
    log("Response Body: ${response.body}");

    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: ${response.body}');
      case 403:
        throw Exception('Forbidden: ${response.body}');
      case 404:
        throw Exception('Not Found: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }

  // Make HTTP request with error handling and timeout
  Future<http.Response> _makeRequest(
      Future<http.Response> request, {
        int timeoutDuration = 30,
      }) async {
    try {
      final response = await request.timeout(Duration(seconds: timeoutDuration));
      return response;
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  // POST DATA
  Future<dynamic> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _makeRequest(
        http.post(
          Uri.parse(endPoint),
          headers: headers ?? {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        ),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  // GET DATA
  Future<dynamic> getData({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await hasInternetConnection();
      if (!isOnline) throw Exception('Device is Offline, Please connect to internet.');

      final response = await _makeRequest(
        http.get(Uri.parse(endPoint), headers: headers),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to get data: $e");
    }
  }

  // PUT (Update) DATA
  Future<dynamic> updateData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final isOnline = await hasInternetConnection();
      if (!isOnline) throw Exception('Device is Offline, Please connect to internet.');

      final response = await _makeRequest(
        http.put(
          Uri.parse(endPoint),
          headers: headers,
          body: jsonEncode(body),
        ),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to update data: $e");
    }
  }

  // PATCH DATA
  Future<dynamic> patchData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final isOnline = await hasInternetConnection();
      if (!isOnline) throw Exception('Device is Offline, Please connect to internet.');

      final response = await _makeRequest(
        http.patch(
          Uri.parse(endPoint),
          headers: headers,
          body: jsonEncode(body),
        ),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to patch data: $e");
    }
  }

  // DELETE DATA
  Future<dynamic> deleteData({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await hasInternetConnection();
      if (!isOnline) throw Exception('Device is Offline, Please connect to internet.');

      final response = await _makeRequest(
        http.delete(Uri.parse(endPoint), headers: headers),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
}
