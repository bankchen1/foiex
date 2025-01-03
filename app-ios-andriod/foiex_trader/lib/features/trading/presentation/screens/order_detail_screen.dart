import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/order_models.dart';
import '../providers/order_provider.dart';
import '../widgets/profit_chart.dart';
import '../widgets/order_statistics_widget.dart';
import '../widgets/time_range_selector.dart';

class OrderDetailScreen extends StatefulWidget {
  final String orderId;

  const OrderDetailScreen({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  late TimeRange _selectedTimeRange;

  @override
  void initState() {
    super.initState();
    _selectedTimeRange = TimeRangeSelector.predefinedRanges[1]; // 30天
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadStatistics();
    });
  }

  void _loadStatistics() {
    context.read<OrderProvider>().loadOrderStatistics(
          startTime: _selectedTimeRange.startTime,
          endTime: _selectedTimeRange.endTime,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<OrderProvider>().refreshOrder(widget.orderId);
              _loadStatistics();
            },
          ),
        ],
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          final order = orderProvider.getOrder(widget.orderId);
          if (order == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              await orderProvider.refreshOrder(widget.orderId);
              await orderProvider.loadOrderStatistics(
                startTime: _selectedTimeRange.startTime,
                endTime: _selectedTimeRange.endTime,
              );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderStatusCard(context, order),
                    const SizedBox(height: 24),
                    _buildProfitSection(context, order),
                    const SizedBox(height: 24),
                    TimeRangeSelector(
                      selectedRange: _selectedTimeRange,
                      onRangeChanged: (range) {
                        setState(() {
                          _selectedTimeRange = range;
                          _loadStatistics();
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildStatisticsSection(context, order),
                    const SizedBox(height: 24),
                    _buildDetailsSection(context, order),
                    const SizedBox(height: 24),
                    if (order.status != 'closed')
                      _buildActionButtons(context, order),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context, Order order) {
    return Consumer<OrderProvider>(
      builder: (context, provider, child) {
        if (provider.isLoadingStats) {
          return const Center(child: CircularProgressIndicator());
        }

        final stats = provider.statistics;
        if (stats == null) {
          return const Center(
            child: Text('No statistics available'),
          );
        }

        return OrderStatisticsWidget(
          statistics: stats.statistics,
          dailyStats: stats.dailyStats,
        );
      },
    );
  }

  Widget _buildOrderStatusCard(BuildContext context, Order order) {
    final theme = Theme.of(context);
    final isProfit = order.profit > 0;

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
                  order.symbol,
                  style: theme.textTheme.titleLarge,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: order.side.toLowerCase() == 'buy'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${order.side.toUpperCase()} ${order.type}',
                    style: TextStyle(
                      color: order.side.toLowerCase() == 'buy'
                          ? Colors.green
                          : Colors.red,
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
                  'Profit/Loss',
                  '\$${order.profit.toStringAsFixed(2)} (${order.profitPercent.toStringAsFixed(2)}%)',
                  isProfit ? Colors.green : Colors.red,
                ),
                _buildStatusItem(
                  context,
                  'Quantity',
                  order.quantity.toString(),
                  null,
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

  Widget _buildProfitSection(BuildContext context, Order order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profit/Loss Chart',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ProfitChart(
            orderId: widget.orderId,
            data: order.profitHistory,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context, Order order) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Details',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDetailRow(
                  context,
                  'Open Price',
                  '\$${order.openPrice.toStringAsFixed(2)}',
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  'Current Price',
                  '\$${order.currentPrice.toStringAsFixed(2)}',
                ),
                const Divider(),
                if (order.stopLoss != null) ...[
                  _buildDetailRow(
                    context,
                    'Stop Loss',
                    '\$${order.stopLoss!.toStringAsFixed(2)}',
                    valueColor: Colors.red,
                  ),
                  const Divider(),
                ],
                if (order.takeProfit != null) ...[
                  _buildDetailRow(
                    context,
                    'Take Profit',
                    '\$${order.takeProfit!.toStringAsFixed(2)}',
                    valueColor: Colors.green,
                  ),
                  const Divider(),
                ],
                _buildDetailRow(
                  context,
                  'Open Time',
                  _formatDateTime(order.openTime),
                ),
                if (order.status == 'closed') ...[
                  const Divider(),
                  _buildDetailRow(
                    context,
                    'Close Time',
                    _formatDateTime(order.closeTime!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: valueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Order order) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _showModifyDialog(context, order),
                child: const Text('Modify'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _showCloseDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Close Order'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showModifyDialog(BuildContext context, Order order) async {
    double? stopLoss = order.stopLoss;
    double? takeProfit = order.takeProfit;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modify Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Stop Loss'),
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                text: stopLoss?.toString() ?? '',
              ),
              onChanged: (value) {
                stopLoss = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Take Profit'),
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                text: takeProfit?.toString() ?? '',
              ),
              onChanged: (value) {
                takeProfit = double.tryParse(value);
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

    if (result == true && context.mounted) {
      try {
        await context.read<OrderProvider>().modifyOrder(
              widget.orderId,
              ModifyOrderRequest(
                stopLoss: stopLoss,
                takeProfit: takeProfit,
              ),
            );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Order modified successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to modify order: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _showCloseDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Close Order'),
        content: const Text(
          'Are you sure you want to close this order? '
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
            child: const Text('Close'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await context.read<OrderProvider>().closeOrder(widget.orderId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Order closed successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to close order: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
