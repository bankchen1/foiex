import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static const String wsUrl = 'ws://localhost:1212/market';
  WebSocketChannel? _channel;
  final _subscriptions = <String, StreamController>{};
  bool _isConnected = false;

  Future<void> connect() async {
    if (_isConnected) return;

    try {
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      _isConnected = true;

      _channel!.stream.listen(
        (message) {
          final data = jsonDecode(message);
          final topic = data['topic'];
          if (_subscriptions.containsKey(topic)) {
            _subscriptions[topic]!.add(data['data']);
          }
        },
        onError: (error) {
          print('WebSocket Error: $error');
          _isConnected = false;
          reconnect();
        },
        onDone: () {
          _isConnected = false;
          reconnect();
        },
      );
    } catch (e) {
      print('WebSocket Connection Error: $e');
      _isConnected = false;
      await Future.delayed(const Duration(seconds: 5));
      reconnect();
    }
  }

  Future<void> reconnect() async {
    if (!_isConnected) {
      await connect();
      // 重新订阅之前的主题
      for (final topic in _subscriptions.keys) {
        subscribe(topic);
      }
    }
  }

  void subscribe(String topic) {
    if (!_subscriptions.containsKey(topic)) {
      _subscriptions[topic] = StreamController.broadcast();
    }
    
    if (_isConnected) {
      _channel?.sink.add(jsonEncode({
        'action': 'subscribe',
        'topic': topic,
      }));
    }
  }

  void unsubscribe(String topic) {
    if (_isConnected) {
      _channel?.sink.add(jsonEncode({
        'action': 'unsubscribe',
        'topic': topic,
      }));
    }
    _subscriptions[topic]?.close();
    _subscriptions.remove(topic);
  }

  Stream<dynamic>? getStream(String topic) {
    return _subscriptions[topic]?.stream;
  }

  void dispose() {
    for (var controller in _subscriptions.values) {
      controller.close();
    }
    _subscriptions.clear();
    _channel?.sink.close();
    _isConnected = false;
  }
}
