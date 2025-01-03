import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/follow_models.dart';
import '../providers/follow_provider.dart';
import '../widgets/performance_chart.dart';

class FollowDetailScreen extends StatelessWidget {
  final String followId;
  final String strategyId;

  const FollowDetailScreen({
    Key? key,
    required this.followId,
    required this.strategyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _showSettingsDialog(context),
          ),
        ],
      ),
      body: Consumer<FollowProvider>(
        builder: (context, followProvider, child) {
          final followStatus = followProvider.getFollowStatus(followId);
          if (followStatus == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () => followProvider.refreshFollowStatus(followId),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatusCard(context, followStatus),
                    const SizedBox(height: 24),
                    _buildPerformanceSection(context, followStatus),
                    const SizedBox(height: 24),
                    _buildTradeHistorySection(context, followStatus),
                    const SizedBox(height: 24),
                    _buildActionButtons(context, followStatus),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, FollowStatus status) {
    final theme = Theme.of(context);
    final isPaused = status.status == 'paused';

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Follow Status',
                  style: theme.textTheme.titleLarge,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isPaused ? Colors.orange : Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    status.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusItem(
                  context,
                  'Total Profit',
                  '\$${status.totalProfit.toStringAsFixed(2)}',
                  status.totalProfit >= 0 ? Colors.green : Colors.red,
                ),
                _buildStatusItem(
                  context,
                  'Allocation',
                  '\$${status.allocation.toStringAsFixed(2)}',
                  null,
                ),
                _buildStatusItem(
                  context,
                  'Max Loss',
                  '\$${status.maxLoss.toStringAsFixed(2)}',
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(
    BuildContext context,
    String label,
    String value,
    Color? valueColor,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceSection(BuildContext context, FollowStatus status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: PerformanceChart(
            followId: followId,
            data: status.performanceData,
          ),
        ),
      ],
    );
  }

  Widget _buildTradeHistorySection(BuildContext context, FollowStatus status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trade History',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: status.tradeHistory.length,
          itemBuilder: (context, index) {
            final trade = status.tradeHistory[index];
            return Card(
              child: ListTile(
                title: Text(trade.symbol),
                subtitle: Text(
                  'Opened: ${trade.openTime.toString()}',
                ),
                trailing: Text(
                  '\$${trade.profit.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: trade.profit >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, FollowStatus status) {
    final isPaused = status.status == 'paused';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _togglePauseStatus(context, isPaused),
            icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            label: Text(isPaused ? 'Resume' : 'Pause'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isPaused ? Colors.green : Colors.orange,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showStopConfirmation(context),
            icon: const Icon(Icons.stop),
            label: const Text('Stop'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _togglePauseStatus(BuildContext context, bool isPaused) async {
    try {
      final provider = context.read<FollowProvider>();
      if (isPaused) {
        await provider.resumeFollow(followId);
      } else {
        await provider.pauseFollow(followId);
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isPaused ? 'Follow resumed' : 'Follow paused',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showStopConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stop Following'),
        content: const Text(
          'Are you sure you want to stop following this strategy? '
          'This action cannot be undone.',
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
            child: const Text('Stop'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await context.read<FollowProvider>().unfollowStrategy(followId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully stopped following the strategy'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _showSettingsDialog(BuildContext context) async {
    final followStatus = context.read<FollowProvider>().getFollowStatus(followId);
    if (followStatus == null) return;

    double? maxLoss = followStatus.maxLoss;
    double? positionRatio = followStatus.positionRatio;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Follow Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Max Loss (\$)'),
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                text: maxLoss.toString(),
              ),
              onChanged: (value) {
                maxLoss = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Position Ratio (%)'),
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                text: (positionRatio * 100).toString(),
              ),
              onChanged: (value) {
                final parsed = double.tryParse(value);
                if (parsed != null) {
                  positionRatio = parsed / 100;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (confirmed == true &&
        context.mounted &&
        maxLoss != null &&
        positionRatio != null) {
      try {
        await context.read<FollowProvider>().updateFollowSettings(
              followId,
              maxLoss: maxLoss!,
              positionRatio: positionRatio!,
            );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Settings updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
