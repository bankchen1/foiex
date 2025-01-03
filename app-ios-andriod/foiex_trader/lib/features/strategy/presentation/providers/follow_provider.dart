import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../data/models/follow_models.dart';
import '../../data/repositories/follow_repository.dart';

class FollowProvider with ChangeNotifier {
  final FollowRepository _repository;
  final Map<String, FollowStatus> _followStatuses = {};
  final Map<String, StreamSubscription> _subscriptions = {};
  final Map<String, FollowStats> _followStats = {};
  bool _isLoading = false;

  FollowProvider(this._repository);

  bool get isLoading => _isLoading;
  List<FollowStatus> get followingStrategies => _followStatuses.values.toList();

  FollowStatus? getFollowStatus(String followId) => _followStatuses[followId];
  FollowStats? getFollowStats(String followId) => _followStats[followId];

  Future<void> loadFollowingStrategies() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    try {
      final strategies = await _repository.getFollowingStrategies();
      
      // Unsubscribe from old strategies that are no longer followed
      final newIds = strategies.map((s) => s.id).toSet();
      _followStatuses.keys
          .where((id) => !newIds.contains(id))
          .forEach(unsubscribeFromStrategy);

      // Update statuses and subscribe to new ones
      _followStatuses.clear();
      for (var strategy in strategies) {
        _followStatuses[strategy.id] = strategy;
        subscribeToStrategy(strategy.id);
      }
    } catch (e) {
      print('Error loading following strategies: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshFollowStatus(String followId) async {
    try {
      final status = await _repository.getFollowStatus(followId);
      _followStatuses[followId] = status;
      notifyListeners();
    } catch (e) {
      print('Error refreshing follow status: $e');
      rethrow;
    }
  }

  Future<void> loadFollowStats(String followId) async {
    try {
      final stats = await _repository.getFollowStats(followId);
      _followStats[followId] = stats;
      notifyListeners();
    } catch (e) {
      print('Error loading follow stats: $e');
      rethrow;
    }
  }

  Future<FollowStatus> followStrategy(FollowRequest request) async {
    try {
      final status = await _repository.followStrategy(request);
      _followStatuses[status.id] = status;
      subscribeToStrategy(status.id);
      notifyListeners();
      return status;
    } catch (e) {
      print('Error following strategy: $e');
      rethrow;
    }
  }

  Future<void> unfollowStrategy(String followId) async {
    try {
      await _repository.unfollowStrategy(followId);
      _followStatuses.remove(followId);
      unsubscribeFromStrategy(followId);
      notifyListeners();
    } catch (e) {
      print('Error unfollowing strategy: $e');
      rethrow;
    }
  }

  Future<void> updateFollowSettings(
    String followId, {
    required double maxLoss,
    required double positionRatio,
  }) async {
    try {
      final status = await _repository.updateFollowSettings(
        followId,
        maxLoss: maxLoss,
        positionRatio: positionRatio,
      );
      _followStatuses[followId] = status;
      notifyListeners();
    } catch (e) {
      print('Error updating follow settings: $e');
      rethrow;
    }
  }

  Future<void> pauseFollow(String followId) async {
    try {
      await _repository.pauseFollow(followId);
      await refreshFollowStatus(followId);
    } catch (e) {
      print('Error pausing follow: $e');
      rethrow;
    }
  }

  Future<void> resumeFollow(String followId) async {
    try {
      await _repository.resumeFollow(followId);
      await refreshFollowStatus(followId);
    } catch (e) {
      print('Error resuming follow: $e');
      rethrow;
    }
  }

  void subscribeToStrategy(String followId) {
    if (_subscriptions.containsKey(followId)) return;

    final stream = _repository.subscribeToFollowStatus(followId);
    if (stream != null) {
      _subscriptions[followId] = stream.listen((status) {
        _followStatuses[followId] = status;
        notifyListeners();
      });
    }
  }

  void unsubscribeFromStrategy(String followId) {
    _subscriptions[followId]?.cancel();
    _subscriptions.remove(followId);
    _repository.unsubscribeFromFollowStatus(followId);
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
