import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../data/models/order_models.dart';
import '../../data/repositories/order_repository.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepository _repository;
  final Map<String, Order> _openOrders = {};
  final Map<String, StreamSubscription> _subscriptions = {};
  final List<OrderHistory> _orderHistory = [];
  bool _isLoadingOpen = false;
  bool _isLoadingHistory = false;
  bool _hasMoreHistory = true;
  int _currentHistoryPage = 1;
  TimeRangeStatistics? _statistics;
  bool _isLoadingStats = false;

  OrderProvider(this._repository);

  bool get isLoadingOpen => _isLoadingOpen;
  bool get isLoadingHistory => _isLoadingHistory;
  bool get hasMoreHistory => _hasMoreHistory;
  List<Order> get openOrders => _openOrders.values.toList();
  List<OrderHistory> get orderHistory => _orderHistory;
  TimeRangeStatistics? get statistics => _statistics;
  bool get isLoadingStats => _isLoadingStats;

  Order? getOrder(String orderId) => _openOrders[orderId];

  Future<void> loadOpenOrders({
    String? followId,
    String? strategyId,
  }) async {
    if (_isLoadingOpen) return;
    _isLoadingOpen = true;
    notifyListeners();

    try {
      final orders = await _repository.getOpenOrders(
        followId: followId,
        strategyId: strategyId,
      );
      
      // Unsubscribe from old orders that are no longer open
      final newOrderIds = orders.map((o) => o.id).toSet();
      _openOrders.keys
          .where((id) => !newOrderIds.contains(id))
          .forEach(unsubscribeFromOrder);

      // Update orders and subscribe to new ones
      _openOrders.clear();
      for (var order in orders) {
        _openOrders[order.id] = order;
        subscribeToOrder(order.id);
      }
    } catch (e) {
      print('Error loading open orders: $e');
    } finally {
      _isLoadingOpen = false;
      notifyListeners();
    }
  }

  Future<void> loadOrderHistory({
    bool refresh = false,
    String? followId,
    String? strategyId,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    if (_isLoadingHistory) return;
    if (refresh) {
      _currentHistoryPage = 1;
      _hasMoreHistory = true;
      _orderHistory.clear();
    }
    if (!_hasMoreHistory) return;

    _isLoadingHistory = true;
    notifyListeners();

    try {
      final orders = await _repository.getOrderHistory(
        page: _currentHistoryPage,
        followId: followId,
        strategyId: strategyId,
        startTime: startTime,
        endTime: endTime,
      );

      if (orders.isEmpty) {
        _hasMoreHistory = false;
      } else {
        _currentHistoryPage++;
        _orderHistory.addAll(orders);
      }
    } catch (e) {
      print('Error loading order history: $e');
    } finally {
      _isLoadingHistory = false;
      notifyListeners();
    }
  }

  Future<void> refreshOrder(String orderId) async {
    try {
      final order = await _repository.getOrder(orderId);
      _openOrders[orderId] = order;
      notifyListeners();
    } catch (e) {
      print('Error refreshing order: $e');
      rethrow;
    }
  }

  Future<void> closeOrder(String orderId) async {
    try {
      await _repository.closeOrder(orderId);
      _openOrders.remove(orderId);
      unsubscribeFromOrder(orderId);
      notifyListeners();
    } catch (e) {
      print('Error closing order: $e');
      rethrow;
    }
  }

  Future<void> modifyOrder(String orderId, ModifyOrderRequest request) async {
    try {
      final updatedOrder = await _repository.modifyOrder(orderId, request);
      _openOrders[orderId] = updatedOrder;
      notifyListeners();
    } catch (e) {
      print('Error modifying order: $e');
      rethrow;
    }
  }

  void subscribeToOrder(String orderId) {
    if (_subscriptions.containsKey(orderId)) return;

    final stream = _repository.subscribeToOrder(orderId);
    if (stream != null) {
      _subscriptions[orderId] = stream.listen((order) {
        _openOrders[orderId] = order;
        notifyListeners();
      });
    }
  }

  void unsubscribeFromOrder(String orderId) {
    _subscriptions[orderId]?.cancel();
    _subscriptions.remove(orderId);
    _repository.unsubscribeFromOrder(orderId);
  }

  Future<void> loadOrderStatistics({
    DateTime? startTime,
    DateTime? endTime,
    String? followId,
    String? strategyId,
  }) async {
    if (_isLoadingStats) return;
    _isLoadingStats = true;
    notifyListeners();

    try {
      _statistics = await _repository.getOrderStatistics(
        startTime: startTime,
        endTime: endTime,
        followId: followId,
        strategyId: strategyId,
      );
    } catch (e) {
      print('Error loading order statistics: $e');
      rethrow;
    } finally {
      _isLoadingStats = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions.values) {
      subscription.cancel();
    }
    _subscriptions.clear();
    super.dispose();
  }
}
