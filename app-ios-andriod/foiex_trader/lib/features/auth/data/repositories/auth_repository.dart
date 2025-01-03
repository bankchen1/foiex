import 'package:dio/dio.dart';
import 'package:foiex_trader/core/services/api_service.dart';
import '../models/auth_models.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<AuthResponse> login(LoginDto loginDto) async {
    try {
      final response = await _apiService.post('/auth/login', data: loginDto.toJson());
      final authResponse = AuthResponse.fromJson(response.data);
      await _apiService.setAuthToken(authResponse.token);
      return authResponse;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<AuthResponse> register(RegisterDto registerDto) async {
    try {
      final response = await _apiService.post('/auth/register', data: registerDto.toJson());
      final authResponse = AuthResponse.fromJson(response.data);
      await _apiService.setAuthToken(authResponse.token);
      return authResponse;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<UserProfile> getUserProfile() async {
    try {
      final response = await _apiService.get('/auth/profile');
      return UserProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> logout() async {
    await _apiService.clearAuthToken();
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.statusCode == 401) {
      return UnauthorizedException(error.response?.data['message'] ?? 'Unauthorized');
    }
    if (error.response?.statusCode == 400) {
      return ValidationException(error.response?.data['message'] ?? 'Validation error');
    }
    return Exception('An error occurred: ${error.message}');
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}
