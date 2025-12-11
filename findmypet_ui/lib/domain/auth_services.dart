import 'package:dio/dio.dart';
import 'package:findmypet/core/constant/application_properties.dart';

class AuthServices {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 15),
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..interceptors.add(
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: false,
            responseBody: true,
            error: true,
          ),
        );

  static Future<String> register(Map<String, dynamic> body) async {
    try {
      final response = await dio.post("/api/auth/register", data: body);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return "User Successfully registered";
      }
      throw Exception('Failed to Register: HTTP ${response.statusCode}');
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      throw Exception('Register error: ${e.type} HTTP $status $data');
    } catch (e) {
      throw Exception('Register error: $e');
    }
  }

  ///login
  static Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    try {
      final response = await dio.post("/api/auth/login", data: body);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Map<String, dynamic>.from(response.data);
      }
      throw Exception('Failed to login: HTTP ${response.statusCode}');
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      throw Exception('Login error: ${e.type} HTTP $status $data');
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }
}
