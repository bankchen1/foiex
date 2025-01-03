import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/follow_models.dart';
import '../providers/follow_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class FollowingStrategiesScreen extends StatefulWidget {
  const FollowingStrategiesScreen({Key? key}) : super(key: key);

  @override
  _FollowingStrategiesScreenState createState() =>
      _FollowingStrategiesScreenState();
}

class _FollowingStrategiesScreenState extends State<FollowingStrategiesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FollowProvider>().loadFollowingStrategies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Following Strategies'),
      ),
      body: Consumer<FollowProvider>(
        builder: (context, followProvider, child) {
          if (followProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (followProvider.followingStrategies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_graph,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Following Strategies',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start following strategies to see them here',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => followProvider.loadFollowingStrategies(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: followProvider.followingStrategies.length,
              itemBuilder: (context, index) {
                final followStatus = followProvider.followingStrategies[index];
                return FollowStatusCard(followStatus: followStatus);
              },
            ),
          );
        },
      ),
    );
  }
}

class FollowStatusCard extends StatelessWidget {
  final FollowStatus followStatus;

  const FollowStatusCard({
    Key? key,
    required this.followStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stats = context.select<FollowProvider, FollowStats?>(
      (provider) => provider.getFollowStats(followStatus.id),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
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
                    'Strategy ${followStatus.strategyId}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(followStatus.status),
              ],
            ),
            const SizedBox(height: 16),
            if (followStatus.performanceData.isNotEmpty)
              SizedBox(
                height: 100,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: followStatus.performanceData
                            .asMap()
                            .entries
                            .map((entry) {
                              return FlSpot(
                                entry.key.toDouble(),
                                entry.value.profit,
                              );
                            })
                            .toList(),
                        isCurved: true,
                        color: followStatus.totalProfit >= 0
                            ? Colors.green
                            : Colors.red,
                        dotData: FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric(
                  'Total Profit',
                  '${followStatus.totalProfit.toStringAsFixed(2)}%',
                  followStatus.totalProfit >= 0 ? Colors.green : Colors.red,
                ),
                _buildMetric(
                  'Today',
                  '${followStatus.todayProfit.toStringAsFixed(2)}%',
                  followStatus.todayProfit >= 0 ? Colors.green : Colors.red,
                ),
                _buildMetric(
                  'Allocation',
                  '\$${followStatus.allocation.toStringAsFixed(2)}',
                  Colors.blue,
                ),
              ],
            ),
            if (stats != null) ...[
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetric(
                    'Win Rate',
                    '${stats.winRate}%',
                    Colors.blue,
                  ),
                  _buildMetric(
                    'Trades',
                    stats.totalTrades.toString(),
                    Colors.blue,
                  ),
                  _buildMetric(
                    'Drawdown',
                    '${stats.maxDrawdown.toStringAsFixed(2)}%',
                    Colors.red,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to follow detail screen
                  },
                  child: const Text('Details'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    _showUnfollowDialog(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: const Text('Unfollow'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'active':
        color = Colors.green;
        break;
      case 'paused':
        color = Colors.orange;
        break;
      case 'stopped':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> _showUnfollowDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unfollow Strategy'),
        content: const Text(
          'Are you sure you want to stop following this strategy? '
          'This will close all open positions.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Unfollow'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await context.read<FollowProvider>().unfollowStrategy(followStatus.id);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully unfollowed strategy'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to unfollow strategy: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
