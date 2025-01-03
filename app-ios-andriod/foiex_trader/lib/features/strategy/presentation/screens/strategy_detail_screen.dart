import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/strategy_provider.dart';
import '../../data/models/strategy_models.dart';

class StrategyDetailScreen extends StatefulWidget {
  final Strategy strategy;

  const StrategyDetailScreen({Key? key, required this.strategy})
      : super(key: key);

  @override
  _StrategyDetailScreenState createState() => _StrategyDetailScreenState();
}

class _StrategyDetailScreenState extends State<StrategyDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StrategyProvider>()
        ..loadStrategyDetails(widget.strategy.id)
        ..subscribeToStrategy(widget.strategy.id);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    context.read<StrategyProvider>().unsubscribeFromStrategy(widget.strategy.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.strategy.name),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Performance'),
            Tab(text: 'Trades'),
          ],
        ),
      ),
      body: Consumer<StrategyProvider>(
        builder: (context, provider, child) {
          final performance = provider.getPerformance(widget.strategy.id);
          final trades = provider.getTrades(widget.strategy.id);

          return TabBarView(
            controller: _tabController,
            children: [
              _buildOverviewTab(widget.strategy),
              if (performance != null)
                _buildPerformanceTab(performance)
              else
                const Center(child: CircularProgressIndicator()),
              if (trades != null)
                _buildTradesTab(trades)
              else
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FollowStrategyScreen(strategy: widget.strategy),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Follow Strategy'),
        ),
      ),
    );
  }

  Widget _buildOverviewTab(Strategy strategy) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMetricRow(
                    'Total Return',
                    '${strategy.totalReturn.toStringAsFixed(2)}%',
                    strategy.totalReturn >= 0 ? Colors.green : Colors.red,
                  ),
                  const Divider(),
                  _buildMetricRow(
                    'Monthly Return',
                    '${strategy.monthlyReturn.toStringAsFixed(2)}%',
                    strategy.monthlyReturn >= 0 ? Colors.green : Colors.red,
                  ),
                  const Divider(),
                  _buildMetricRow(
                    'Max Drawdown',
                    '${strategy.maxDrawdown.toStringAsFixed(2)}%',
                    Colors.red,
                  ),
                  const Divider(),
                  _buildMetricRow(
                    'Sharpe Ratio',
                    strategy.sharpeRatio.toStringAsFixed(2),
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(strategy.description),
          const SizedBox(height: 16),
          const Text(
            'Trading Pairs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: strategy.tradingPairs.map((pair) {
              return Chip(label: Text(pair));
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceTab(StrategyPerformance performance) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: performance.points
                        .asMap()
                        .entries
                        .map((entry) {
                          return FlSpot(
                            entry.key.toDouble(),
                            entry.value.value,
                          );
                        })
                        .toList(),
                    isCurved: true,
                    color: Colors.blue,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMetricRow(
                    'Win Rate',
                    '${performance.winRate}%',
                    Colors.green,
                  ),
                  const Divider(),
                  _buildMetricRow(
                    'Total Trades',
                    performance.totalTrades.toString(),
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTradesTab(List<TradeHistory> trades) {
    return ListView.builder(
      itemCount: trades.length,
      itemBuilder: (context, index) {
        final trade = trades[index];
        final isProfit = trade.profit > 0;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(trade.symbol),
            subtitle: Text(
              '${trade.type} • ${_formatDate(trade.entryTime)}',
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isProfit ? '+' : ''}${trade.profit.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isProfit ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${isProfit ? '+' : ''}${trade.profitPercent.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: isProfit ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMetricRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
