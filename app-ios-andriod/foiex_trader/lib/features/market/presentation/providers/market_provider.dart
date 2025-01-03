import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../data/models/market_models.dart';
import '../../data/repositories/market_repository.dart';

class MarketProvider with ChangeNotifier {
  final MarketRepository _repository;
  final Map<String, MarketTicker> _tickers = {};
  final Map<String, MarketDepth> _depths = {};
  final Map<String, List<Kline>> _klines = {};
  final Map<String, StreamSubscription> _tickerSubscriptions = {};
  bool _isLoading = false;

  MarketProvider(this._repository);

  bool get isLoading => _isLoading;
  List<MarketTicker> get tickers => _tickers.values.toList();
  MarketDepth? getDepth(String symbol) => _depths[symbol];
  List<Kline>? getKlines(String symbol) => _klines[symbol];

  Future<void> loadTickers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final tickers = await _repository.getTickers();
      for (var ticker in tickers) {
        _tickers[ticker.symbol] = ticker;
      }
    } catch (e) {
      print('Error loading tickers: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadDepth(String symbol) async {
    try {
      final depth = await _repository.getDepth(symbol);
      _depths[symbol] = depth;
      notifyListeners();
    } catch (e) {
      print('Error loading depth: $e');
    }
  }

  Future<void> loadKlines(String symbol, String interval) async {
    try {
      final klines = await _repository.getKlines(symbol, interval);
      _klines[symbol] = klines;
      notifyListeners();
    } catch (e) {
      print('Error loading klines: $e');
    }
  }

  void subscribeToTicker(String symbol) {
    if (_tickerSubscriptions.containsKey(symbol)) return;

    final stream = _repository.subscribeToTicker(symbol);
    if (stream != null) {
      _tickerSubscriptions[symbol] = stream.listen((ticker) {
        _tickers[symbol] = ticker;
        notifyListeners();
      });
    }
  }

  void unsubscribeFromTicker(String symbol) {
    _tickerSubscriptions[symbol]?.cancel();
    _tickerSubscriptions.remove(symbol);
    _repository.unsubscribeFromTicker(symbol);
  }

  @override
  void dispose() {
    for (var subscription in _tickerSubscriptions.values) {
      subscription.cancel();
    }
    _tickerSubscriptions.clear();
    super.dispose();
  }
}
