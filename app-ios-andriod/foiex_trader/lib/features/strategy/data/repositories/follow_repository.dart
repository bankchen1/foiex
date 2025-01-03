import 'package:dio/dio.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/websocket_service.dart';
import '../models/follow_models.dart';

class FollowRepository {
  final ApiService _apiService;
  final WebSocketService _wsService;

  FollowRepository(this._apiService, this._wsService);

  Future<FollowStatus> followStrategy(FollowRequest request) async {
    try {
      final response = await _apiService.post(
        '/follow',
        data: request.toJson(),
      );
      return FollowStatus.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<FollowStatus> updateFollowSettings(
    String followId, {
    double? maxLoss,
    double? positionRatio,
  }) async {
    try {
      final response = await _apiService.put(
        '/follow/$followId',
        data: {
          if (maxLoss != null) 'maxLoss': maxLoss,
          if (positionRatio != null) 'positionRatio': positionRatio,
        },
      );
      return FollowStatus.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> unfollowStrategy(String followId) async {
    try {
      await _apiService.delete('/follow/$followId');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<FollowStatus>> getFollowingStrategies() async {
    try {
      final response = await _apiService.get('/follow');
      return (response.data['items'] as List)
          .map((json) => FollowStatus.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<FollowStatus> getFollowStatus(String followId) async {
    try {
      final response = await _apiService.get('/follow/$followId');
      return FollowStatus.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<FollowStats> getFollowStats(String followId) async {
    try {
      final response = await _apiService.get('/follow/$followId/stats');
      return FollowStats.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<TradeHistory>> getTradeHistory(
    String followId, {
    int page = 1,
    int pageSize = 20,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'pageSize': pageSize,
        if (startTime != null)
          'startTime': startTime.toUtc().toIso8601String(),
        if (endTime != null)
          'endTime': endTime.toUtc().toIso8601String(),
      };

      final response = await _apiService.get(
        '/follow/$followId/trades',
        queryParameters: queryParams,
      );

      return (response.data['items'] as List)
          .map((json) => TradeHistory.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> pauseFollow(String followId) async {
    try {
      await _apiService.post('/follow/$followId/pause');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> resumeFollow(String followId) async {
    try {
      await _apiService.post('/follow/$followId/resume');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Stream<FollowStatus>? subscribeToFollowStatus(String followId) {
    final topic = 'follow.$followId';
    _wsService.subscribe(topic);
    return _wsService.getStream(topic)?.map((data) => FollowStatus.fromJson(data));
  }

  void unsubscribeFromFollowStatus(String followId) {
    _wsService.unsubscribe('follow.$followId');
  }

  Exception _handleDioError(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return ValidationException(
            error.response?.data['message'] ?? 'Invalid request parameters');
      case 403:
        return AuthorizationException('Insufficient permissions');
      case 404:
        return NotFoundException('Follow not found');
      case 409:
        return ConflictException('Already following this strategy');
      default:
        return Exception('An error occurred: ${error.message}');
    }
  }
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}

class AuthorizationException implements Exception {
  final String message;
  AuthorizationException(this.message);
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
}

class ConflictException implements Exception {
  final String message;
  ConflictException(this.message);
}
