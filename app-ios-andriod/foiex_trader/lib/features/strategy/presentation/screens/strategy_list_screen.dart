import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/strategy_provider.dart';
import '../../data/models/strategy_models.dart';
import 'strategy_detail_screen.dart';

class StrategyListScreen extends StatefulWidget {
  const StrategyListScreen({Key? key}) : super(key: key);

  @override
  _StrategyListScreenState createState() => _StrategyListScreenState();
}

class _StrategyListScreenState extends State<StrategyListScreen> {
  final _scrollController = ScrollController();
  String? _sortBy;
  bool _ascending = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StrategyProvider>().loadStrategies();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<StrategyProvider>().loadStrategies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading Strategies'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                if (_sortBy == value) {
                  _ascending = !_ascending;
                } else {
                  _sortBy = value;
                  _ascending = true;
                }
              });
              context.read<StrategyProvider>().setSort(_sortBy, _ascending);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'totalReturn',
                child: Text('Sort by Return'),
              ),
              const PopupMenuItem(
                value: 'followersCount',
                child: Text('Sort by Followers'),
              ),
              const PopupMenuItem(
                value: 'sharpeRatio',
                child: Text('Sort by Sharpe Ratio'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<StrategyProvider>(
        builder: (context, strategyProvider, child) {
          if (strategyProvider.strategies.isEmpty && strategyProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () => strategyProvider.loadStrategies(refresh: true),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: strategyProvider.strategies.length +
                  (strategyProvider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= strategyProvider.strategies.length) {
                  return strategyProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox();
                }

                final strategy = strategyProvider.strategies[index];
                return StrategyCard(strategy: strategy);
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class StrategyCard extends StatelessWidget {
  final Strategy strategy;

  const StrategyCard({Key? key, required this.strategy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StrategyDetailScreen(strategy: strategy),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      strategy.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${strategy.totalReturn.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: strategy.totalReturn >= 0
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                strategy.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetric('Monthly', '${strategy.monthlyReturn.toStringAsFixed(2)}%'),
                  _buildMetric('Drawdown', '${strategy.maxDrawdown.toStringAsFixed(2)}%'),
                  _buildMetric('Sharpe', strategy.sharpeRatio.toStringAsFixed(2)),
                  _buildMetric('Followers', strategy.followersCount.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
