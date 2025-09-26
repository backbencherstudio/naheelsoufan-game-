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
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }

  // POST DATA
  Future<dynamic> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final http.Response response;

    final defaultHeaders = {
      'Content-Type': 'application/json',
    };

    final combinedHeaders = {
      ...defaultHeaders,
      if (headers != null) ...headers,
    };

    try {
        response = await http.post(
          Uri.parse(endPoint),
          headers: combinedHeaders,
          body: jsonEncode(body),
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
    http.Response response;
    try {
      final isOnline = await hasInternetConnection();
      if (isOnline) {
        response = await http.get(
          Uri.parse(endPoint),
          headers: headers,
        );
        return _handleResponse(response);
      } else {
        throw Exception('Device is Offline, Please connect to internet.');
      }
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
    http.Response response;
    try {
      final isOnline = await hasInternetConnection();
      if (isOnline) {
        response = await http.put(
          Uri.parse(endPoint),
          headers: headers,
          body: jsonEncode(body),
        );
        return _handleResponse(response);
      } else {
        throw Exception('Device is Offline, Please connect to internet.');
      }
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
    http.Response response;
    try {
      final isOnline = await hasInternetConnection();
      if (isOnline) {
        response = await http.patch(
          Uri.parse(endPoint),
          headers: headers,
          body: jsonEncode(body),
        );
        return _handleResponse(response);
      } else {
        throw Exception('Device is Offline, Please connect to internet.');
      }
    } catch (e) {
      throw Exception("Failed to patch data: $e");
    }
  }

  // DELETE DATA
  Future<dynamic> deleteData({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    http.Response response;
    try {
      final isOnline = await hasInternetConnection();
      if (isOnline) {
        response = await http.delete(
          Uri.parse(endPoint),
          headers: headers,
        );
        return _handleResponse(response);
      } else {
        throw Exception('Device is Offline, Please connect to internet.');
      }
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
}
