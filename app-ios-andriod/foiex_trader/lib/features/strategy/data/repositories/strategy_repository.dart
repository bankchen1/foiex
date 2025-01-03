import 'package:dio/dio.dart';
import 'package:foiex_trader/core/services/api_service.dart';
import 'package:foiex_trader/core/services/websocket_service.dart';
import '../models/strategy_models.dart';

class StrategyRepository {
  final ApiService _apiService;
  final WebSocketService _wsService;
  static const int pageSize = 20;

  StrategyRepository(this._apiService, this._wsService);

  Future<List<Strategy>> getStrategies({
    int page = 1,
    String? sortBy,
    bool? ascending,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'pageSize': pageSize,
        if (sortBy != null) 'sortBy': sortBy,
        if (ascending != null) 'ascending': ascending,
        if (filters != null) ...filters,
      };

      final response = await _apiService.get(
        '/strategies',
        queryParameters: queryParams,
      );

      return (response.data['items'] as List)
          .map((json) => Strategy.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Strategy> getStrategyById(String id) async {
    try {
      final response = await _apiService.get('/strategies/$id');
      return Strategy.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<StrategyPerformance> getStrategyPerformance(String id) async {
    try {
      final response = await _apiService.get('/strategies/$id/performance');
      return StrategyPerformance.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<TradeHistory>> getStrategyTrades(String id, {int page = 1}) async {
    try {
      final response = await _apiService.get(
        '/strategies/$id/trades',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      return (response.data['items'] as List)
          .map((json) => TradeHistory.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Stream<Strategy>? subscribeToStrategy(String id) {
    final topic = 'strategy.$id';
    _wsService.subscribe(topic);
    return _wsService.getStream(topic)?.map((data) => Strategy.fromJson(data));
  }

  void unsubscribeFromStrategy(String id) {
    _wsService.unsubscribe('strategy.$id');
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.statusCode == 404) {
      return StrategyNotFoundException('Strategy not found');
    }
    if (error.response?.statusCode == 400) {
      return ValidationException(
          error.response?.data['message'] ?? 'Validation error');
    }
    return Exception('An error occurred: ${error.message}');
  }
}

class StrategyNotFoundException implements Exception {
  final String message;
  StrategyNotFoundException(this.message);
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}
