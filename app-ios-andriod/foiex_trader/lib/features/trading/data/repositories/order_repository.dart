import 'package:dio/dio.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/websocket_service.dart';
import '../models/order_models.dart';

class OrderRepository {
  final ApiService _apiService;
  final WebSocketService _wsService;
  static const int pageSize = 20;

  OrderRepository(this._apiService, this._wsService);

  Future<List<Order>> getOpenOrders({
    int page = 1,
    String? followId,
    String? strategyId,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'pageSize': pageSize,
        if (followId != null) 'followId': followId,
        if (strategyId != null) 'strategyId': strategyId,
      };

      final response = await _apiService.get(
        '/orders/open',
        queryParameters: queryParams,
      );

      return (response.data['items'] as List)
          .map((json) => Order.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<OrderHistory>> getOrderHistory({
    int page = 1,
    String? followId,
    String? strategyId,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'pageSize': pageSize,
        if (followId != null) 'followId': followId,
        if (strategyId != null) 'strategyId': strategyId,
        if (startTime != null)
          'startTime': startTime.toUtc().toIso8601String(),
        if (endTime != null) 'endTime': endTime.toUtc().toIso8601String(),
      };

      final response = await _apiService.get(
        '/orders/history',
        queryParameters: queryParams,
      );

      return (response.data['items'] as List)
          .map((json) => OrderHistory.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Order> getOrder(String orderId) async {
    try {
      final response = await _apiService.get('/orders/$orderId');
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<ProfitPoint>> getProfitHistory(
    String orderId, {
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    try {
      final queryParams = {
        if (startTime != null)
          'startTime': startTime.toUtc().toIso8601String(),
        if (endTime != null)
          'endTime': endTime.toUtc().toIso8601String(),
      };

      final response = await _apiService.get(
        '/orders/$orderId/profits',
        queryParameters: queryParams,
      );

      return (response.data['items'] as List)
          .map((json) => ProfitPoint.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<OrderAction>> getOrderActions(String orderId) async {
    try {
      final response = await _apiService.get('/orders/$orderId/actions');
      return (response.data['items'] as List)
          .map((json) => OrderAction.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> closeOrder(String orderId) async {
    try {
      await _apiService.post('/orders/$orderId/close');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Order> modifyOrder(String orderId, ModifyOrderRequest request) async {
    try {
      final response = await _apiService.put(
        '/orders/$orderId',
        data: request.toJson(),
      );
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<TimeRangeStatistics> getOrderStatistics({
    DateTime? startTime,
    DateTime? endTime,
    String? followId,
    String? strategyId,
  }) async {
    try {
      final queryParams = {
        if (startTime != null)
          'startTime': startTime.toUtc().toIso8601String(),
        if (endTime != null)
          'endTime': endTime.toUtc().toIso8601String(),
        if (followId != null) 'followId': followId,
        if (strategyId != null) 'strategyId': strategyId,
      };

      final response = await _apiService.get(
        '/orders/statistics',
        queryParameters: queryParams,
      );

      return TimeRangeStatistics.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Stream<Order>? subscribeToOrder(String orderId) {
    final topic = 'order.$orderId';
    _wsService.subscribe(topic);
    return _wsService.getStream(topic)?.map((data) => Order.fromJson(data));
  }

  void unsubscribeFromOrder(String orderId) {
    _wsService.unsubscribe('order.$orderId');
  }

  Exception _handleDioError(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return ValidationException(
            error.response?.data['message'] ?? 'Invalid request parameters');
      case 403:
        return AuthorizationException('Insufficient permissions');
      case 404:
        return NotFoundException('Order not found');
      case 409:
        return ConflictException('Order already closed');
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
