import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../data/models/strategy_models.dart';
import '../../data/repositories/strategy_repository.dart';

class StrategyProvider with ChangeNotifier {
  final StrategyRepository _repository;
  final Map<String, Strategy> _strategies = {};
  final Map<String, StrategyPerformance> _performances = {};
  final Map<String, List<TradeHistory>> _trades = {};
  final Map<String, StreamSubscription> _subscriptions = {};
  
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _sortBy;
  bool? _ascending;
  Map<String, dynamic>? _filters;

  StrategyProvider(this._repository);

  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  List<Strategy> get strategies => _strategies.values.toList();
  
  StrategyPerformance? getPerformance(String id) => _performances[id];
  List<TradeHistory>? getTrades(String id) => _trades[id];

  Future<void> loadStrategies({bool refresh = false}) async {
    if (_isLoading) return;
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      _strategies.clear();
    }
    if (!_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final strategies = await _repository.getStrategies(
        page: _currentPage,
        sortBy: _sortBy,
        ascending: _ascending,
        filters: _filters,
      );

      if (strategies.isEmpty) {
        _hasMore = false;
      } else {
        _currentPage++;
        for (var strategy in strategies) {
          _strategies[strategy.id] = strategy;
        }
      }
    } catch (e) {
      print('Error loading strategies: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadStrategyDetails(String id) async {
    try {
      final strategy = await _repository.getStrategyById(id);
      _strategies[id] = strategy;
      
      final performance = await _repository.getStrategyPerformance(id);
      _performances[id] = performance;
      
      final trades = await _repository.getStrategyTrades(id);
      _trades[id] = trades;

      notifyListeners();
    } catch (e) {
      print('Error loading strategy details: $e');
      rethrow;
    }
  }

  void subscribeToStrategy(String id) {
    if (_subscriptions.containsKey(id)) return;

    final stream = _repository.subscribeToStrategy(id);
    if (stream != null) {
      _subscriptions[id] = stream.listen((strategy) {
        _strategies[id] = strategy;
        notifyListeners();
      });
    }
  }

  void unsubscribeFromStrategy(String id) {
    _subscriptions[id]?.cancel();
    _subscriptions.remove(id);
    _repository.unsubscribeFromStrategy(id);
  }

  void setSort(String? sortBy, bool? ascending) {
    _sortBy = sortBy;
    _ascending = ascending;
    loadStrategies(refresh: true);
  }

  void setFilters(Map<String, dynamic>? filters) {
    _filters = filters;
    loadStrategies(refresh: true);
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
