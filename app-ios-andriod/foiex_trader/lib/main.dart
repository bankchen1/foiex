import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/api_service.dart';
import 'core/services/websocket_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/market/data/repositories/market_repository.dart';
import 'features/market/presentation/providers/market_provider.dart';
import 'features/market/presentation/screens/market_screen.dart';
import 'features/strategy/data/repositories/strategy_repository.dart';
import 'features/strategy/data/repositories/follow_repository.dart';
import 'features/strategy/presentation/providers/strategy_provider.dart';
import 'features/strategy/presentation/providers/follow_provider.dart';
import 'features/trading/data/repositories/order_repository.dart';
import 'features/trading/presentation/providers/order_provider.dart';
import 'features/trading/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ApiService(),
        ),
        Provider(
          create: (context) => WebSocketService(),
        ),
        ProxyProvider<ApiService, AuthRepository>(
          update: (context, apiService, previous) => AuthRepository(apiService),
        ),
        ProxyProvider2<ApiService, WebSocketService, MarketRepository>(
          update: (context, apiService, wsService, previous) =>
              MarketRepository(apiService, wsService),
        ),
        ProxyProvider2<ApiService, WebSocketService, StrategyRepository>(
          update: (context, apiService, wsService, previous) =>
              StrategyRepository(apiService, wsService),
        ),
        ProxyProvider2<ApiService, WebSocketService, FollowRepository>(
          update: (context, apiService, wsService, previous) =>
              FollowRepository(apiService, wsService),
        ),
        ProxyProvider2<ApiService, WebSocketService, OrderRepository>(
          update: (context, apiService, wsService, previous) =>
              OrderRepository(apiService, wsService),
        ),
        ChangeNotifierProxyProvider<AuthRepository, AuthProvider>(
          create: (context) => AuthProvider(context.read<AuthRepository>()),
          update: (context, authRepository, previous) =>
              previous ?? AuthProvider(authRepository),
        ),
        ChangeNotifierProxyProvider<MarketRepository, MarketProvider>(
          create: (context) => MarketProvider(context.read<MarketRepository>()),
          update: (context, marketRepository, previous) =>
              previous ?? MarketProvider(marketRepository),
        ),
        ChangeNotifierProxyProvider<StrategyRepository, StrategyProvider>(
          create: (context) => StrategyProvider(context.read<StrategyRepository>()),
          update: (context, strategyRepository, previous) =>
              previous ?? StrategyProvider(strategyRepository),
        ),
        ChangeNotifierProxyProvider<FollowRepository, FollowProvider>(
          create: (context) => FollowProvider(context.read<FollowRepository>()),
          update: (context, followRepository, previous) =>
              previous ?? FollowProvider(followRepository),
        ),
        ChangeNotifierProxyProvider<OrderRepository, OrderProvider>(
          create: (context) => OrderProvider(context.read<OrderRepository>()),
          update: (context, orderRepository, previous) =>
              previous ?? OrderProvider(orderRepository),
        ),
      ],
      child: MaterialApp(
        title: 'FOIEX Trader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/market': (context) => const MarketScreen(),
        },
      ),
    );
  }
}
