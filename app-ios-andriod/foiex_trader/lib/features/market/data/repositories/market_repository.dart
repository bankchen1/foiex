import 'package:dio/dio.dart';
import 'package:foiex_trader/core/services/api_service.dart';
import 'package:foiex_trader/core/services/websocket_service.dart';
import '../models/market_models.dart';

class MarketRepository {
  final ApiService _apiService;
  final WebSocketService _wsService;

  MarketRepository(this._apiService, this._wsService);

  Future<List<MarketTicker>> getTickers() async {
    try {
      final response = await _apiService.get('/market/tickers');
      return (response.data as List)
          .map((json) => MarketTicker.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch tickers: ${e.message}');
    }
  }

  Future<MarketDepth> getDepth(String symbol) async {
    try {
      final response = await _apiService.get('/market/depth', 
          queryParameters: {'symbol': symbol});
      return MarketDepth.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch depth: ${e.message}');
    }
  }

  Future<List<Kline>> getKlines(String symbol, String interval) async {
    try {
      final response = await _apiService.get('/market/klines',
          queryParameters: {'symbol': symbol, 'interval': interval});
      return (response.data as List)
          .map((json) => Kline.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch klines: ${e.message}');
    }
  }

  Stream<MarketTicker>? subscribeToTicker(String symbol) {
    final topic = 'ticker.$symbol';
    _wsService.subscribe(topic);
    return _wsService.getStream(topic)?.map((data) => MarketTicker.fromJson(data));
  }

  Stream<MarketDepth>? subscribeToDepth(String symbol) {
    final topic = 'depth.$symbol';
    _wsService.subscribe(topic);
    return _wsService.getStream(topic)?.map((data) => MarketDepth.fromJson(data));
  }

  void unsubscribeFromTicker(String symbol) {
    _wsService.unsubscribe('ticker.$symbol');
  }

  void unsubscribeFromDepth(String symbol) {
    _wsService.unsubscribe('depth.$symbol');
  }
}
