import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/order_models.dart';

class ProfitChart extends StatelessWidget {
  final List<ProfitPoint> profitPoints;
  final double height;
  final Color? positiveColor;
  final Color? negativeColor;

  const ProfitChart({
    Key? key,
    required this.profitPoints,
    this.height = 200,
    this.positiveColor,
    this.negativeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profitPoints.isEmpty) {
      return SizedBox(height: height);
    }

    final minProfit = profitPoints.map((p) => p.profit).reduce((a, b) => a < b ? a : b);
    final maxProfit = profitPoints.map((p) => p.profit).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _createSpots(),
              isCurved: true,
              color: Theme.of(context).primaryColor,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: (positiveColor ?? Theme.of(context).primaryColor).withOpacity(0.1),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  final profit = profitPoints[touchedSpot.x.toInt()].profit;
                  return LineTooltipItem(
                    '\$${profit.toStringAsFixed(2)}',
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
          ),
          minX: 0,
          maxX: (profitPoints.length - 1).toDouble(),
          minY: minProfit,
          maxY: maxProfit,
        ),
      ),
    );
  }

  List<FlSpot> _createSpots() {
    return List.generate(profitPoints.length, (index) {
      final point = profitPoints[index];
      return FlSpot(index.toDouble(), point.profit);
    });
  }
}
