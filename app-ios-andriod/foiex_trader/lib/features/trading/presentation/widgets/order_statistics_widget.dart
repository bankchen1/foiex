import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/order_statistics.dart';

class OrderStatisticsWidget extends StatelessWidget {
  final TimeRangeStatistics statistics;

  const OrderStatisticsWidget({
    Key? key,
    required this.statistics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMainStats(context),
        const SizedBox(height: 16),
        _buildDailyPerformanceChart(context),
        const SizedBox(height: 16),
        _buildDetailedStats(context),
      ],
    );
  }

  Widget _buildMainStats(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem(
                  context,
                  '胜率',
                  '${(statistics.statistics.winRate * 100).toStringAsFixed(2)}%',
                  statistics.statistics.winRate >= 0.5 ? Colors.green : Colors.red,
                ),
                _buildStatItem(
                  context,
                  '盈亏比',
                  statistics.statistics.profitLossRatio.toStringAsFixed(2),
                  statistics.statistics.profitLossRatio >= 1 ? Colors.green : Colors.red,
                ),
                _buildStatItem(
                  context,
                  '总交易',
                  statistics.statistics.totalTrades.toString(),
                  Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildDailyPerformanceChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '每日收益',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= statistics.dailyStats.length) {
                            return const Text('');
                          }
                          final date = statistics.dailyStats[value.toInt()].date;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${date.month}/${date.day}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$${value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: statistics.dailyStats.asMap().entries.map((entry) {
                        return FlSpot(
                          entry.key.toDouble(),
                          entry.value.profit,
                        );
                      }).toList(),
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedStats(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '详细统计',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildDetailedStatRow(
              context,
              '最大盈利',
              '\$${statistics.statistics.maxProfit.toStringAsFixed(2)}',
              Colors.green,
            ),
            _buildDetailedStatRow(
              context,
              '最大亏损',
              '\$${statistics.statistics.maxLoss.toStringAsFixed(2)}',
              Colors.red,
            ),
            _buildDetailedStatRow(
              context,
              '平均盈利',
              '\$${statistics.statistics.averageProfit.toStringAsFixed(2)}',
              Colors.green,
            ),
            _buildDetailedStatRow(
              context,
              '平均亏损',
              '\$${statistics.statistics.averageLoss.toStringAsFixed(2)}',
              Colors.red,
            ),
            _buildDetailedStatRow(
              context,
              '盈利因子',
              statistics.statistics.profitFactor.toStringAsFixed(2),
              Colors.blue,
            ),
            _buildDetailedStatRow(
              context,
              '夏普比率',
              statistics.statistics.sharpeRatio.toStringAsFixed(2),
              Colors.blue,
            ),
            _buildDetailedStatRow(
              context,
              '最大回撤',
              '${(statistics.statistics.maxDrawdown * 100).toStringAsFixed(2)}%',
              Colors.orange,
            ),
            _buildDetailedStatRow(
              context,
              '平均持仓时间',
              _formatDuration(statistics.statistics.averageHoldingTime),
              Colors.blue,
            ),
            _buildDetailedStatRow(
              context,
              '最佳连胜',
              statistics.statistics.bestWinStreak.toStringAsFixed(0),
              Colors.green,
            ),
            _buildDetailedStatRow(
              context,
              '最差连亏',
              statistics.statistics.worstLossStreak.toStringAsFixed(0),
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedStatRow(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(double hours) {
    if (hours < 1) {
      return '${(hours * 60).round()}分钟';
    } else if (hours < 24) {
      return '${hours.round()}小时';
    } else {
      return '${(hours / 24).round()}天';
    }
  }
}
